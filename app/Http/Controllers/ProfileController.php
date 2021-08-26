<?php

namespace App\Http\Controllers;

use App\Category;
use App\Comment;
use App\Tag;
use App\Post;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function index() {
        $user = Auth::user();
        return view('profile.profile',['user' => $user]);
    }
    public function showPosts() {
        $posts = Auth::user()->posts;
       return view('profile.posts.posts',['posts' => $posts]);
    }
    public function showComments() {
        $comments = Auth::user()->comments;
       return view('profile.comments',['comments' => $comments]);
    }
    public function destroyComments($id) {
        Comment::find($id)->remove();
        return redirect()->back();
    }
    public function store(Request $request) {
        $user = Auth::user();
        $this->validate($request, [
            'name'=>'required',
            'email' =>  [
                'required',
                'email',
                Rule::unique('users')->ignore($user->id),
            ],
            'avatar' => 'nullable|image' 
        ]);
        $user -> edit($request->all());
        $user-> generatePassword($request->get('password'));
        $user->uploadAvatar($request->file('avatar'));
         
        return redirect()->back()->with('status','Профиль успешно обновлен');

    }

    public function newPost() {
        $tags = Tag::pluck('title','id')->all();
        $categories = Category::pluck('title','id')->all();
        return view('profile.posts.create',
        compact(
            'categories',
            'tags'
        )
        );
    }
    public function storePost(Request $request) {
        $this->validate($request,[
            'title'  =>  'required',
            'content' =>  'required',
            'date'  =>  'required',
            'image'    =>  'nullable|image'
        ]);
        $AuthorID = Auth::user()->id;
        $post = Post::add($request->all());
        $post->uploadImage($request->file('image'));
        $post->setCategory($request->get('category_id'));
        $post->setTags($request->get('tags'));
        $post->setDraft();
        $post -> setAuthor($AuthorID);
        $post -> setStandart();
        return redirect()->back()->with('status','Статья скоро будет добавлена!');
    }

}
