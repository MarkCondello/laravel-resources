<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Post::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        //$user = User::factory()->create();

        return [
            //'user_id' => $user->id,
            'user_id' => function(){
                return User::factory()->create()->id;
            },
            'title' => $this->faker->sentence(1),
            'body' => $this->faker->paragraph(1),

        ];
    }
}
