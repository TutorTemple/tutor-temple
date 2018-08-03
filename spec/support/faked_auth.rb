class FakedAuth
  def facebook_data
    {
      'provider' => 'facebook',
      'uid' => '4600051000057',
      'info' => {
        'email' => 'vladymyr.kovtun@gmail.com',
        'name' => 'William Krofton',
        'first_name' => 'William',
        'last_name' => 'Krofton',
        'avatar' => 'http://graph.facebook.com/4600051000057/picture',
        'urls' => { 'Facebook' => 'https://www.facebook.com/app_scoped_user_id/4600051000057/' },
        'verified' => true
      },
      'credentials' => {
        'token' => 'CAAXG7M01etEBAMdqZA0zLj7T9bkh7cNR1aRS424Enkcix2MvMui671aXTSGmjOPU8TpOIGE6dLLkMPTPfBcshaW66HgioMsd2mEj1NbBtQVV2SNg1lhFT5johChlx79jZCRV75ZBPxWNMjZBxinJrfuoNfiZB0PCTYs8gRAEcep8PyOZCl2PuIn9ZBzse5mGJrG5Fjql2emu7vdLsEBaKjG',
        'expires_at' => 1439455058,
        'expires' => true
      },
      'extra' => {
        'raw_info' => {
          'id' => '4600051000057',
          'email' => 'vladymyr.kovtun@gmail.com',
          'first_name' => 'William',
          'gender' => 'male',
          'last_name' => 'Krofton',
          'link' => 'https://www.facebook.com/app_scoped_user_id/4600051000057/',
          'locale' => 'ua_UA',
          'name' => 'William Krofton',
          'timezone' => 3,
          'updated_time' => '2016-05-19T20:03:42+0000',
          'verified' => true
        }
      }
    }
  end

  def google_data
    {
      'provider' => 'google_oauth2',
      'uid' => '106772057320789192894',
      'info' => {
        'name' => 'NativeSpeaker',
        'email' => 'vladymyr.kovtun@gmail.com',
        'first_name' => 'William',
        'last_name' => 'Krofton',
        'image' => '"#{Rails.root}/spec/fixtures/files/avatar.png"'
      },
      'credentials' => {
        'token' => 'ya29.kgHeQGheb1uydYXPrtTAVsmKX0HSAzIFeceMC9aC9OTBHttIySzFzjmf8N_lUagqUmCtIH2e0fSk1g',
        'expires_at' => 1434290777,
        'expires' => true
      },
      'extra' => {
        'id_token' => 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImJhNDE3Y2M3Y2QyNmQyMmUxMmQ3ODQ4MzI3YmM0YzM4MzVkOGU0NDYifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwic3ViIjoiMTA2NzcyMDU3MzIwNzg5MTkyODk0IiwiYXpwIjoiMTk4OTAyNzY2NzAwLXAwcTRiNHQ3bzJoODM4OWhlbXM2cGdndW9zMWF1a2doLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiZW1haWwiOiJ0b3RhbGFkdmVudHVyZWRldkBnbWFpbC5jb20iLCJhdF9oYXNoIjoibVh0TTFfejNoXzdUR29JQTZzdUpVQSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdWQiOiIxOTg5MDI3NjY3MDAtcDBxNGI0dDdvMmg4Mzg5aGVtczZwZ2d1b3MxYXVrZ2guYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJpYXQiOjE0MzQyODcxNzcsImV4cCI6MTQzNDI5MDc3N30.uxmBXgmFuTiVJLhd1pSelXeXs0WtZ412wrcYbnN-sdTJl_OlwLmofFey_NfxrimysedfvqsPrJr7hb2CNG_1CArsbAPwq2Vg4-FwQ8UnO6hE7aGTUrkoyNhUvlKoYR9HeuzTsHgpvD4Pqc4YauyT5mRHJYZUyXZGASUQYOKBGfjynU0I-VmSyYUJ7DynakqpU4nLuiT6_b3Gpl7HXS3d8IejoS5vaD3zgm8yjnqBVdnNxpySP6iAA3T99acPFc16lXoEr1j8OdLOrySeFGSScB_9y1zbvo9q8lMS_AMU1vGHxqR4gGO57g4xFTuVNbNeK0TEvCz8Qf5TONeT3x8J3w',
        'raw_info' => {
          'kind' => 'plus#personOpenIdConnect',
          'sub' => '106772057320789192894',
          'name' => 'NativeSpeaker',
          'given_name' => 'William',
          'family_name' => 'Krofton',
          'picture' => '"#{Rails.root}/spec/fixtures/files/avatar.png"',
          'email' => 'vladymyr.kovtun@gmail.com',
          'email_verified' => 'true',
          'locale' => 'ua_UA'
        }
      }
    }
  end
end
