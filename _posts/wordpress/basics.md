zM Ajax Login & Register [https://wordpress.org/plugins/zm-ajax-login-register/]


## Upload with API

In `functions.php` Insert following code

    $decoded_bits = base64_decode( $bits );
    if ( $decoded_bits ) {
        $bits = $decoded_bits;
    }

before the line:

    @fwrite( $ifp, $bits );
