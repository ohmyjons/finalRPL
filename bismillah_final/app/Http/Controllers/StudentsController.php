<?php

namespace App\Http\Controllers;

use App\Student;
use App\subject;

use Illuminate\Http\Request;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $student = student::all();
        // dd($student);
        return view('students.index',['student'=>$student]);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('students.create');


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $student = new student;
        $student->nama_depan = $request->nama_depan;
        $student->nama_belakang = $request->nama_belakang;
        $student->jenis_kelamin = $request->jenis_kelamin;
        $student->agama = $request->agama;
        $student->email = $request->email;
        $student->alamat = $request->alamat;
        $student->avatar = $request->avatar;

        // dd($student);
        $student->save();
        
        return redirect('/siswa')->with('sukses','data berhasil ditambah!!!');
        
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
        $student = student::find($id);
        return view('students.edit',['student'=>$student]);
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
        // dd($request->all());
        $student = student::find($id);
        /*
        $student->nama_depan = $request->nama_depan;
        $student->nama_belakang = $request->nama_belakang;
        $student->jenis_kelamin = $request->jenis_kelamin;
        $student->agama = $request->agama;
        $student->email = $request->email;
        $student->alamat = $request->alamat;
        $student->avatar = $request->avatar;*/
        $student->update($request->all());
        if ($request->hasFile('avatar')) {
           $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
           $student->avatar = $request->file('avatar')->getClientOriginalName();
           $student->save();
        }
        // dd($student->all());
        // $student ->update();
        return redirect('/siswa') -> with('sukses','data berhasil di update');



    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $student = student::find($id);
        $student->delete();

        return redirect('/siswa') -> with('sukses','data berhasil di hapus');
    }

    public function profile($id)
    {
        $student = Student::find($id);
        $subject = subject::all();
        // $subject =  
        // dd($student);

        //menyiakan data untuk chart
        $categories = [];
        $data = [];
        foreach ($subject as $sbjct) {
            if ($student->subject()->wherePivot('subject_id',$sbjct->id)->first()) {
                $categories[] = $sbjct->nama;
                $data[] = $student->subject()->wherePivot('subject_id',$sbjct->id)->first()->pivot->nilai;   
            }
        }
        // dd($mp);
        // $data[] = $student->subject()->wherePivot('subject_id',$mp->id)->first()->pivot->nilai;
        // dd($data);
        /*
        if ($student->subject()->wherePivot('subject_id',$mp->id)->first() != NULL) {
            // return redirect('siswa/'.$id.'/profile');
        }*/
        
        // dd($categories);
        // dd($data);
        return view('students.profile',['student'=>$student,'mapel'=>$subject,'categories'=>$categories,'data'=>$data]);

    }


    // urusan perNilaian

    public function addnilai(Request $request,$idstudent)
    {
        // dd($request->all());
        // dd($idstudent);

        $student = student::find($idstudent);

        if ($student->subject()->where('subject_id',$request->mapel)->exists()) {

            return redirect('siswa/'.$idstudent.'/profile')->with('error','Data nilai telah ada'); 
        }
        $student->subject()->attach($request->mapel,['nilai'=>$request->nilai]);

        return redirect('siswa/'.$idstudent.'/profile')->with('sukses','Data nilai Berhasil di Tambah');
    }

    public function deletenilai($id,$idsubject)
    {
        $student = Student::find($id);
        $student->subject()->detach($idsubject);
        
        return redirect()->back()->with('sukses','nilai berhasil di hapus');
    }
    
}
