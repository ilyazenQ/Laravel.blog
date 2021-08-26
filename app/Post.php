<?php

namespace App;

use App\Comment;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class Post extends Model
{
    use Sluggable;
    protected $fillable = ['title','content','date','description'];

    public function category() {
        return $this->belongsTo(Category::class);
    }
    public function author() {
        return $this->belongsTo(User::class,'user_id');
    }
    public function comments() {
        return $this->hasMany(Comment::class);
    }
    public function tags() {
        return $this->belongsToMany(
            Tag::class,
            'post_tags',
            'post_id',
            'tag_id'

        );
    }
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
    public static function add($fields){
    $post = new self;
    $post->fill($fields);
    $post->user_id = Auth::user()->id;
    $post->save();
    return $post;
    }
    public function edit($fields){
       $this->fill($fields);
       $this->save();
    }
    public function remove(){
        // удалить картинку
        $this->removeImage();

        $this->delete();
    }
    public function uploadImage($image) {
        if($image == null) {
            return;
        }
        $this->removeImage();

        $filename = Str::random(10).".". $image->extension();
        $image->storeAs('uploads',$filename);
        $this->image = $filename;
        $this->save();
    }
    public function removeImage() {
        if($this->image != null) {
            Storage::delete('uploads/'.$this->image);

        }
    }
    public function setCategory($id) {
        if($id == null) {
            return;
        }
        $this->category_id = $id;
        $this->save();
    }
    public function setTags($ids) {
        if($ids == null) {
            return;
        }
        $this->tags()->sync($ids);
    }
    public function setDraft() {
        $this->status = 0;
        $this->save();
    }
    public function setPublic(){
        $this->status = 1;
        $this->save();
    }
    public function toggleStatus($value) {
        if($value == null ) {
            return $this->setDraft();
        } else {
            return $this->setPublic();
        }
    }
    public function setFeatured() {
        $this->is_featured = 1;
        $this->save();
    }
    public function setStandart(){
        $this->is_featured= 0;
        $this->save();
    }
    public function setAuthor($id) {
        $this->user_id = $id;
        $this->save();
    }
    public function toggleFeatured($value) {
        if($value == null) {
           return $this->setStandart();
        } else {
            return $this->setFeatured();
        }
    }
    public function getImage() {
        if($this->image == null) {
            return '/img/no-image-.jpg';
        }
        return '/uploads/'.$this->image;
    }
    public function setDateAttribute($value)
    {
        $date = Carbon::createFromFormat('d/m/y', $value)->format('Y-m-d');
        $this->attributes['date'] = $date;
    }
    public function getDateAttribute($value)
    {
        $date = Carbon::createFromFormat('Y-m-d', $value)->format('d/m/y');

        return $date;
    }
    public function getCategoryTitle() {
        if($this->category != null) {
            return $this->category->title;
        }
        return 'Нет категории';
    }
    public function getCategoryID() {
        if($this->category != null) {
            return $this->category->id;
        }
        return 'Нет категории';
    }
    public function getTagsTitles() {
        return (!$this->tags->isEmpty())
            ?   implode(', ', $this->tags->pluck('title')->all())
            : 'Нет тегов';
    }
    public function getDate() {
        return Carbon::createFromFormat('d/m/y', $this->date)->format('F d, Y');
    }
    public function hasPrevious(){
      return self::where('id','<',$this->id)->max('id');
    }
    public function hasNext(){
       return self::where('id','>',$this->id)->min('id');
    }
    public function getPrevious(){
        $postID = $this->hasPrevious();
        return self::find($postID);
    }
    public function getNext(){
        $postID = $this->hasNext();
        return self::find($postID);
    }
    public function related() {
        return self::all()->except($this->id);
    }
    public function hasCategory(){
        return $this->category != null? true : false;
    }
    public function getComments(){
        return  $this->comments()->where('status',1)->get();
    }
   


}
