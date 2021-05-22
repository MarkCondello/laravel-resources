<?php

namespace App\Services\File;

use App\Models\File;
use App\Models\User;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Storage;

class FileService
{
    // protected static $baseUrl               = 'http://d2p4on5yypr7sm.cloudfront.net/';
    // protected static $placeholderImage      = '';
    protected static $postAttachedFilesLink    = 'post-attached-files/';
    // protected static $avatarFilesLink       = 'avatars/';
    // protected static $logoFilesLink         = 'logos/';
 
    // public static function getBaseURL()
    // {
    //     return 'http://d2p4on5yypr7sm.cloudfront.net/';
    //     // https://d2p4on5yypr7sm.cloudfront.net/avatars/UzeMXobuI8dlNMVQmqLNtDpXcu6BLWIkmL8A0ZPE.png
    // }

    /*public static function getAvatarUrl(File $file)
    {
        return self::$base.''.self::$avatarFilesLink.'/'.$file->hash_name;
    }*/

    // public static function getAvatarUrl(File $file)
    // {
    //     return self::$avatarFilesLink.$file->hash_name;
    // }

    // public static function getLogoURL(File $file)
    // {
    //     return self::$avatarFilesLink.$file->hash_name;
    // }

    // public static function getTinyUrl(File $file)
    // {
    //     return self::$tinyFilesLink.$file->hash_name;
    // }

    // public static function getClientLogosURL()
    // {
    //     return self::$logoFilesLink;
    // }

    public static function getPostAttachedFilesURL()
    {
        return self::$postAttachedFilesLink;
        //return self::getBaseURL() . self::$postAttachedFilesLink;
    }

    // public static function delete(File $file)
    // {
    //     if (Storage::disk('s3')->exists('')) {
    //         Storage::disk('s3')->delete('');
    //     }
    //     $file->delete();
    // }

    public static function save($request, File $file = null, $uploadable_type, $uploadable_id)
    {
        if ($file === null) {
            $file = new File();
        }
        $fileUpload = $request->file('uploadFile');

        $file->original_name = $fileUpload->getClientOriginalName();
        $file->hash_name     = $fileUpload->hashName();
        $file->size          = $fileUpload->getSize();
        $file->file_type     = $fileUpload->guessClientExtension();
        $file->user_id       = auth()->id();

        $file->uploadable_type  = $uploadable_type;
        $file->uploadable_id    = $uploadable_id;
        //Store image in database
        $file->save();
        //Store image locally 
        $fileUpload->storeAs('', $fileUpload->getClientOriginalName());
        return $file;
    }

    // public static function saveAvatar($fileUpload, User $user)
    // {
    //     $user->update(['image' => $fileUpload->hashName()]);

    //     //Store image into cloud
    //     $fileUpload->storeAs('avatars/', $fileUpload->hashName(), 's3');

    //     return $user;
    // }

    // public static function saveLogo($fileUpload, Client $client)
    // {
    //     $client->update(['logo_url' => $fileUpload->hashName()]);

    //     //Store image into cloud
    //     $fileUpload->storeAs('logos/', $fileUpload->hashName(), 's3');

    //     return $client;
    // }
    // public static function saveImage($fileUpload, Project $project)
    // {
    //     $project->update(['image_url' => $fileUpload->hashName()]);

    //     //Store image into cloud
    //     $fileUpload->storeAs('logos/', $fileUpload->hashName(), 's3');

    //     return $project;
    // }

 
}
