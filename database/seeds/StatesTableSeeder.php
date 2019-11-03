<?php

use App\Models\State;
use Illuminate\Database\Seeder;

class StatesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $states = [
            'Andaman and Nicobar Islands'=>'AN',
            'Andhra Pradesh' =>	'AP',
            'Arunachal Pradesh' =>	'AR',
            'Assam' =>	'AS',
// Bihar	BR
// Chandigarh	CH	
// Chhattisgarh	CT	
// Dadra and Nagar Haveli	DN	
// Daman and Diu	DD
// Delhi	DL	
// Goa	GA	
// Gujarat	GJ	
// Haryana	HR	
// Himachal Pradesh	HP	
// Jammu and Kashmir	JK	
// Jharkhand	JH	IN-JH
// Karnataka	KA	IN-KA;KRN
// Kerala	KL	IN-KL;KER
// Lakshadweep	LD	IN-LD;LKP
// Madhya Pradesh	MP	IN-MP
// Maharashtra	MH	IN-MH;MAH
// Manipur	MN	IN-MN;MNP
// Meghalaya	ML	IN-ML;MEG
// Mizoram	MZ	IN-MZ;MIZ
// Nagaland	NL	IN-NL;NLD
// Odisha	OR	IN-OR;OD;Orissa
// Puducherry	PY	IN-PY;PDY
// Punjab	PB	IN-PB
// Rajasthan	RJ	IN-RJ;RAJ
// Sikkim	SK	IN-SK;SKM
// Tamil Nadu	TN	IN-TN
// Telangana	TG	IN-TG;TS
// Tripura	TR	IN-TR;TRP
// Uttar Pradesh	UP	IN-UP
// Uttarakhand	UT	IN-UT;UK;UA;Uttaranchal
// West Bengal	WB	IN-WB

        ];

        collect($states)->each(function($code,$name){

            State::create([
                'code' => $code,
                'name' => $name
            ]);
        });
    }


}

