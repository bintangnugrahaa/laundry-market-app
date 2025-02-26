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

    function whereUserId($id)
    {
        $laundries = Laundry::where('user_id', $id)
            ->with(['shop', 'user'])
            ->orderBy('created_at', 'desc')
            ->get();

        if ($laundries->isNotEmpty()) {
            return response()->json([
                'data' => $laundries,
            ], 200);
        } else {
            return response()->json([
                'message' => 'Not found',
                'data'    => $laundries,
            ], 404);
        }
    }
}
