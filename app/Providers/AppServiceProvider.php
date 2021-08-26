<?php

namespace App\Providers;

use App\Category;
use App\Comment;
use App\Tag;
use Illuminate\Http\Request;
use App\Post;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();

        view()->composer('pages._sidebar',function($view){
           $view->with('popularPosts', Post::orderBy('views','desc')
               ->take(3)
               ->get());
            $view->with('featuredPosts',Post::where('is_featured',1)
                ->take(3)
                ->get());
                $view->with('recentPosts',Post::orderBy('date','desc')
                    ->take(4)
                    ->get());
                    $view->with('categories',Category::all());
        });

        view()->composer('admin._sidebar',function($view){
            $view->with('newCommentsCount', 
            Comment::where('status',0)->count());
            $view->with('draftPostsCount', 
            Post::where('status',0)->count());
         });
    }
}
