<?php

namespace App\Http\Controllers;

use App\Category;
use App\Tag;
use Illuminate\Http\Request;
use App\Post;

class HomeController extends Controller
{
    public function index(){
        $posts = Post::where('status',1)->
        orderBy('created_at','DESC')->
        paginate(5);
        $categories = Category::all();
        $featuredPosts = Post::where('is_featured',1)
        ->take(5)
        ->get();
        return view('pages.index',[
            'posts'=>$posts,
            'categories'=>$categories,
            'featuredPosts' => $featuredPosts
            ]
        );
    }
    public function show($slug) {
        $categories = Category::all();
        $post = Post::where('slug',$slug)->firstOrFail();
        $featuredPosts = Post::where('is_featured',1)
        ->take(5)
        ->get();
        return view('pages.show',[
            'post'=>$post,
            'categories'=>$categories,
            'featuredPosts' => $featuredPosts
        ]);
    }
    public function tag($slug){
        $tag = Tag::where('slug',$slug)->firstOrFail();
        $posts = $tag->posts()->where('status',1)->paginate(2);
        return view('pages.list',['posts'=>$posts]);

    }
    public function category($slug){
   
        $category = Category::where('slug',$slug)->firstOrFail();
        $categories = Category::all();
        $featuredPosts = Post::where('is_featured',1)
        ->take(5)
        ->get();
        $posts = $category->posts()->where('status',1)->paginate(2);
        return view('pages.list',['posts'=>$posts,
        'categories'=>$categories,
        'featuredPosts' => $featuredPosts,
        'categoryTitle' =>$category->title,
    ]);

    }
    public function search(Request $request) {
        $this->validate($request, [
            'search'=>'required'
        ]);
        $search = $request->search;
        $posts = Post::where('status',1)->where('title','LIKE',"%{$search}%")->
        orderBy('created_at','DESC')->
        paginate(5);
        $categories = Category::all();
        $featuredPosts = Post::where('is_featured',1)
        ->take(5)
        ->get();
        return view('pages.index',[
            'posts'=>$posts,
            'categories'=>$categories,
            'featuredPosts' => $featuredPosts
            ]
        );

    }
}
