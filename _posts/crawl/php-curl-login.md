# Login with PHP curl

```php
$username  = "user@gmail.com";
$password  = "pass";
$url       = "http://www.web.net/";
$cookie    = "cookie.txt";
$login_url = $url . "user/login.html";
$postdata  = "email=". $username ."&password=". $password. "&remember=1";

// Login and store 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $login_url);
curl_setopt($ch, CURLOPT_REFERER, $url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
curl_setopt($ch, CURLOPT_COOKIEJAR, 'cookie.txt');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_exec($ch);

$finished = false;
while (!$finished) {

	// Save results of request in a file
	$output     = fopen('output.html','w');
	$target_url = "http://www.downloadnow.net/files.html";
	curl_setopt($ch, CURLOPT_URL, $target_url);
	curl_setopt($ch, CURLOPT_FILE, $output);
	curl_exec($ch);
	fclose($output);

	// Getting the variable (id)
	// javascript:Downloadnow.Files.deleteFile('45f31e65a4f828c30002', 'http://rapid...rar')
	$pattern = "deleteFile";
	$lines = file('output.html');
	$ids = array();
	foreach ($lines as $line) {
		if (strlen(strstr($line, $pattern))>0) {
			$items = split($pattern, $line);
			foreach ($items as $i => $item) {
				$values = split("\"", $item);
				if (strlen($values[1])==20) {
					$ids[$i] = $values[1];
				}
			}
		}
	}

	if (count($ids)==0) {
		echo "Nothing else to delete, good bye!\n";
		$finished = true; 
	} else {
		echo "Page deleting...\n";
	}

	// posting with ajax 
	$delete_url = "http://www.downloadnow.net/ajax_delete_files.html";

	$post = "";
	foreach ($ids as $id) {
		$post  = $post."tokens[]=$id&";
	}	

	$output = fopen('tmp.html','w');
	echo "post: ".substr($post, 0, -1) . "\n";
	curl_setopt($ch, CURLOPT_URL, $delete_url);
	curl_setopt($ch, CURLOPT_REFERER, $url);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_FILE, $output);
	curl_setopt($ch, CURLOPT_POSTFIELDS, substr($post, 0, -1));
	curl_exec($ch);
	fclose($output);
```