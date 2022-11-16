<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function images()
    {
        return $this->hasMany(Image::class);
    }

    public function contents()
    {
        return $this->hasMany(Content::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function scopeWithAll($query)
    {
        return $query->with('images', 'content', 'category');
    }
}
