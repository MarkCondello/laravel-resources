## Running Front end tests
A .babelrc file is required to run the tests. However including this file breaks the build process with npm.

To test mock api calls, json-server is used and should use a different port. 
I couldn;t find a way to run this inside docker but it runs on the host machine 

```json-server --watch db.json --port 5000```

## Eloquent/Tinker details

The below is a useful tip forviewing the raw sql queries generated by Laravel in tinker

```DB::enableQueryLog();```
Do some tinker queries
```DB::getQueryLog();```

##Seeding

Generating the Belongs To, Has Many Through data
We can run the Posts seeder which will create a user for each post. Users in turn will create their own Affiliation.
App\Models\Post::factory()->count(22)->create(['user_id' => 1]);

Generating the polymorphic data 
We can create data for the Videos morphTo entity to connect to:
App\Models\Series::factory()->count(4)->create();
App\Models\Collection::factory()->count(4)->create();

Once these above seeds have been added, include a few rows in the Videos table paying attention to the watchable_type as this needs to be the same as the model that it is referencing eg:
 1,App\Models\Series,1,Parkour madness,Dazzling stunts in European cities.,youtube.com,2021-02-18 10:09:21,NULL