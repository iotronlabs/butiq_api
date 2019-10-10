<?php

namespace App\Http\Controllers\Api\Verify;

use App\Mail\VerifyMail;
use App\Models\OTPVerify;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Foundation\Auth\RegistersUsers;


class OTPVerifyController extends Controller
{
    use RegistersUsers;

    public function __construct()
    {
        $this->middleware('guest');
    }

    protected function create(Request $request)
    {   
        //dd($request->email);
        $user = OTPVerify::create([
            'temp_email' => $request->email,
            'token_email' => '1720',
        ]);


        Mail::to($user->temp_email)->send(new VerifyMail($user));
              
        return $user;
    }

    protected function check_Validation(Request $request)
    {
        $email = $request->email;
        $otp = $request->otp;
        if(OTPVerify::where(['temp_email'=>  $email, 'token_email' => $otp ] )->exists())
        {   
            OTPVerify::where(['temp_email' =>  $email, 'token_email' => $otp])
                        ->update(['verified' => 1, 'email_verified_at' => NOW()]);
        


                        
            return response()->json([
                'success' => true,
                'message' => 'Your OTP verified Successfully and updated'
               
            ], 200);
        }else{
              
            return response()->json([
                'success'=> false,
                'message' => 'Your OTP  is incorrect '
            ]);
        }
       

    }

    protected function destroy(Request $request)
    {
        $email = $request->email;
      
     
        if(OTPVerify::where('temp_email', $email)->exists())
        {  
               // dd("exists");
                OTPVerify::where('temp_email', $email)->delete();
        }else
            {
                dd("Not exists");
            }

    }
}
