<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Work;
use Illuminate\Support\Carbon;

class WorkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Work::orderBy('created_at', 'ASC')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $work = new Work;
        $work->name = $request->work["name"];
        $work->save();

        return $work;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $work = Work::find($id);

        if ($work) {
            $work->delete();
            return "Work successfully deleted.";
        }

        return "Work not found.";
    }
    
    public function startWork(Request $request, $id)
    {
        $work = Work::find($id);

        if ($work) {
            $work->start_working = Carbon::now();
            $work->save();
            return $work;
        }

        return "Work not found.";
    }

    public function stopWork(Request $request, $id)
    {
        $work = Work::find($id);

        if ($work) {
            $work->completed = $request->work['completed'] ? true : false;
            $work->end_working = $request->work['completed'] ? Carbon::now() : null;
            $work->save();
            return $work;
        }

        return "Work not found.";
    }

    public function searchData($date)
    {
        $work = Work::where('start_working', 'LIKE', '%'.$date.'%')->get();
        return $work;
    }

    public function searchDataRange($date_from, $date_to)
    {
        $work = Work::whereBetween('start_working', [$date_from, $date_to])->get();
        return $work;
    }
}
