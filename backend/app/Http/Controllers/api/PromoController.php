<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Promo;
use Illuminate\Http\Request;

class PromoController extends Controller
{
    function readAll()
    {
        $promos = Promo::with(['shop'])->get();

        return response()->json([
            'data' => $promos
        ], 200);
    }

    function readLimit()
    {
        $promos = Promo::orderBy('created_at', 'desc')
            ->limit(5)
            ->with('shop')
            ->get();

        if ($promos->isNotEmpty()) {
            return response()->json([
                'data' => $promos,
            ], 200);
        } else {
            return response()->json([
                'message' => 'Not found',
                'data'    => $promos,
            ], 404);
        }
    }
}
