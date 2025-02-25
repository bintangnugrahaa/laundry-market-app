<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Laundry;
use Illuminate\Http\Request;

use function Pest\Laravel\get;

class LaundryController extends Controller
{
    function readAll()
    {
        $laundries = Laundry::with(['user', 'shop'])->get();

        return response()->json([
            'data' => $laundries
        ], 200);
    }
}
