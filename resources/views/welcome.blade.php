@extends('layout.web')

@section('content')
<div class="grid grid-cols-1 md:grid-cols-2">

    <div class="p-6">
        <div class="flex items-center">

            <svg width="30" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas"
                data-icon="link" class="svg-inline--fa fa-link fa-w-16" role="img" viewBox="0 0 512 512">

                <path fill="#a0aec0"
                    d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z" />
                </svg>
            <!-- <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" class="w-8 h-8 text-gray-500"><path d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path></svg> -->
            <div class="ml-4 text-lg leading-7 font-semibold"><a href="{{route('eloquent.list')}}"
                    class="underline text-gray-900 dark:text-white">Eloquent</a></div>
        </div>

        <div class="ml-12">
            <div class="mt-2 text-gray-600 dark:text-gray-400 text-sm">
                Reference material related to the frequently used Eloquent relationships.
            </div>
        </div>
    </div>


    <div class="p-6 border-t border-gray-200 dark:border-gray-700 md:border-t-0 md:border-l">
        <div class="flex items-center">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                <path
                    d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253">
                </path>
            </svg>
            <div class="ml-4 text-lg leading-7 font-semibold"><a href="https://laravel.com/docs"
                    class="underline text-gray-900 dark:text-white">Documentation</a></div>
        </div>

        <div class="ml-12">
            <div class="mt-2 text-gray-600 dark:text-gray-400 text-sm">
                This Laravel has wonderful, thorough documentation covering every aspect of the framework. Whether you
                are new to the framework or have previous experience with Laravel, we recommend reading all of the
                documentation from beginning to end.
            </div>
        </div>
    </div>

    <div class="p-6 border-t border-gray-200 dark:border-gray-700">
        <div class="flex items-center">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                <path
                    d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z">
                </path>
                <path d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"></path>
            </svg>
            <div class="ml-4 text-lg leading-7 font-semibold"><a href="https://laracasts.com"
                    class="underline text-gray-900 dark:text-white">Laracasts</a></div>
        </div>

        <div class="ml-12">
            <div class="mt-2 text-gray-600 dark:text-gray-400 text-sm">
                Laracasts offers thousands of video tutorials on Laravel, PHP, and JavaScript development. Check them
                out, see for yourself, and massively level up your development skills in the process.
            </div>
        </div>
    </div>

    <div class="p-6 border-t border-gray-200 dark:border-gray-700 md:border-l">
        <div class="flex items-center">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                <path d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z">
                </path>
            </svg>
            <div class="ml-4 text-lg leading-7 font-semibold"><a href="https://laravel-news.com/"
                    class="underline text-gray-900 dark:text-white">Laravel News</a></div>
        </div>

        <div class="ml-12">
            <div class="mt-2 text-gray-600 dark:text-gray-400 text-sm">
                Laravel News is a community driven portal and newsletter aggregating all of the latest and most
                important news in the Laravel ecosystem, including new package releases and tutorials.
            </div>
        </div>
    </div>

    <div class="p-6 border-t border-gray-200 dark:border-gray-700  ">
        <div class="flex items-center">
            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                viewBox="0 0 24 24" class="w-8 h-8 text-gray-500">
                <path
                    d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                </path>
            </svg>
            <div class="ml-4 text-lg leading-7 font-semibold text-gray-900 dark:text-white">Vibrant Ecosystem</div>
        </div>

        <div class="ml-12">
            <div class="mt-2 text-gray-600 dark:text-gray-400 text-sm">
                Laravel's robust library of first-party tools and libraries, such as <a href="https://forge.laravel.com"
                    class="underline">Forge</a>, <a href="https://vapor.laravel.com" class="underline">Vapor</a>, <a
                    href="https://nova.laravel.com" class="underline">Nova</a>, and <a href="https://envoyer.io"
                    class="underline">Envoyer</a> help you take your projects to the next level. Pair them with powerful
                open source libraries like <a href="https://laravel.com/docs/billing" class="underline">Cashier</a>, <a
                    href="https://laravel.com/docs/dusk" class="underline">Dusk</a>, <a
                    href="https://laravel.com/docs/broadcasting" class="underline">Echo</a>, <a
                    href="https://laravel.com/docs/horizon" class="underline">Horizon</a>, <a
                    href="https://laravel.com/docs/sanctum" class="underline">Sanctum</a>, <a
                    href="https://laravel.com/docs/telescope" class="underline">Telescope</a>, and more.
            </div>
        </div>
    </div>

    <div class="p-6 border-t border-gray-200 dark:border-gray-700 md:border-l">
        <div class="flex items-center">

            <div class="ml-4 text-lg leading-7 font-semibold text-gray-900 dark:text-white">Authentication</div>
        </div>
    </div>
</div>
 
@endsection