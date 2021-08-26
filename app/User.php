<?php

namespace App;

use App\Comment;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email','description'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function posts() {
        return $this->hasMany(Post::class);
    }
    public function comments(){
        return $this->hasMany(Comment::class);
    }
    public static function add($fields){
        $user = new self;
        $user->fill($fields);
        $user->save();
        return $user;
    }
    public function edit($fields){
        $this->fill($fields);
        $this->save();
    }
    public function remove(){
        // удалить картинку
        $this->removeAvatar();

        $this->delete();
    }

    public function uploadAvatar($image)
    {
        if($image == null) { return; }

        $this->removeAvatar();

        $filename = Str::random(10).".". $image->extension();
        $image->storeAs('uploads', $filename);
        $this->avatar = $filename;
        $this->save();
    }
    public function removeAvatar()
    {
        if($this->avatar != null)
        {
            Storage::delete('uploads/' . $this->avatar);
        }
    }
    public function generatePassword($password)
    {
        if($password != null)
        {
            $this->password = bcrypt($password);
            $this->save();
        }
    }
    public function getAvatar() {
        if($this->avatar == null) {
            return '/img/no-image-.jpg';
        }
        return '/uploads/'.$this->avatar;
    }
    public function makeAdmin() {
       $this->is_admin = 1;
        $this->save();

    }
    public function makeNormal() {
        $this->is_admin = 0;
        $this->save();

    }
    public function toggleAdmin($value){
        if($value == null) {
            return $this->makeNormal();
        }
        return $this->makeAdmin();
    }
    public function ban() {
        $this->status = 1;
        $this->save();

    }
    public function unban() {
        $this->status = 0;
        $this->save();

    }
    public function toggleBan($value){
        if($value == null) {
            return $this->unban();
        }
        return $this->ban();
    }
}
