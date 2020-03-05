<?php

namespace App\Http\Controllers\Api\Verify;

use App\User;
use App\Mail\VerifyMail;
use App\Models\OTPVerify;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Console\Scheduling\Schedule;
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
        //$check_user = User::where('email','=', $request->email);
        if(User::where('email', $request->email)->first()){

            return response()->json([
                'success' => false,
                'message' => 'Email Already Exists'

            ], 230);

        }else{
            $fourdigit = mt_rand(1000,9999);
            //dd($request->email);
            $user = OTPVerify::create([
                'temp_email' => $request->email,
                'token_email' => $fourdigit,

            ]);

            Mail::to($user->temp_email)->send(new VerifyMail($user));

             return response()->json([
                    'success' => true,
                    'message' => 'OTP sent Successfully'

                ], 200);
        }
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
                'message' => 'OTP verified Successfully'

            ], 200);
        }else{

            return response()->json([
                'success'=> false,
                'message' => 'OTP  is incorrect '
            ]);
        }
    }

    protected function destroy(Request $request)
    {
        $email = $request->email;
        if(OTPVerify::where('temp_email', $email)->exists())
        {

                OTPVerify::where('temp_email', $email)->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Record Deleted Successfully'

                ], 200);
        }else
            {
                return response()->json([
                    'success' => true,
                    'message' => 'OTP sent Successfully'
                ], 200);
            }
    }

    // protected function schedule(Schedule $schedule)
    // {
    //     $schedule->call(function () {
    //         OTPVerify::where('temp_email', $email)->exists();
    //     })->everyMinute();
    // }


}
