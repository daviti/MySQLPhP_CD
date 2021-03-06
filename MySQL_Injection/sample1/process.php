<?php
	session_start();
	require_once('connection.php');

	if(isset($_POST['action']) && $_POST['action'] == "register")
		register_action();

	if(isset($_POST['action']) && $_POST['action'] == "login")
		login_action();

	if(isset($_POST['action']) && $_POST['action'] == "logout")
		logout();

	if(isset($_POST['action']) && $_POST['action'] == "post")
		post_action();

	if(isset($_POST['action']) && $_POST['action'] == "comment")
		comment_action();

	function register_action()
	{
		if(empty($_POST['first_name']))
			$_SESSION['errors'][] = "First Name field is required";

		if(empty($_POST['last_name']))
			$_SESSION['errors'][] = "Last Name field is required";

		if(empty($_POST['email']))
			$_SESSION['errors'][] = "Email field is required";

		if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
			$_SESSION['errors'][] = "Invalid Email";

		if(empty($_POST['password']))
			$_SESSION['errors'][] = "Password Field is requried";

		if(empty($_POST['confirm_password']))
			$_SESSION['errors'][] = "Confirm Password Field is required";

		if($_POST['password'] != $_POST['confirm_password'])
			$_SESSION['errors'][] = "Passwords do not match!";

		if(empty($_SESSION['errors']))
		{
			$check_email_query = "SELECT * FROM users WHERE email = '". $_POST['email'] ."' ";
			$check_email = fetch_record($check_email_query);

			if(!$check_email)
			{
				$password = md5($_POST['password']);
				$insert_user_query = "INSERT INTO users (first_name, last_name, email, password, created_at) VALUES ('". mysql_real_escape_string($_POST['first_name']) ."', '". mysql_real_escape_string($_POST['last_name']) ."', '". mysql_real_escape_string($_POST['email']) ."', '". mysql_real_escape_string($password) ."', NOW()) ";
				$insert_user_result = mysql_query($insert_user_query);

				if($insert_user_result)
				{
					$user = array(
						"id" => mysql_insert_id(),
						"first_name" => $_POST['first_name'],
						"last_name" => $_POST['last_name'],
						"email" => $_POST['email'],
						"logged_in" => TRUE
					);

					$_SESSION['user'] = $user;
					header('Location: wall.php');
				}
				else
				{
					$_SESSION['errors'][] = "Someting went wrong. Please check database connection.";
					header('Location: index.php');					
				}
			}
			else
			{
				$_SESSION['errors'][] = "Email address already exist!";
				header('Location: index.php');				
			}
		}
		else
			header('Location: index.php');
	}

	function login_action()
	{
		if(empty($_POST['email']))
			$_SESSION['errors'][] = "Email field is required";

		if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
			$_SESSION['errors'][] = "Invalid Email";
		
		if(empty($_POST['password']))
			$_SESSION['errors'][] = "Password Field is requried";

		if(empty($_SESSION['errors']))
		{
			$check_user = "SELECT * FROM users WHERE email = '". $_POST['email'] ."' AND password = '". md5($_POST['password']) . "' ";
			$user = fetch_record($check_user);

			if($user == false)
			{
				$_SESSION['errors'][] = "Invalid email and password combination.";
				header('Location: index.php');
			}
			else
			{
				$user += array(
					"logged_in" => TRUE
				);

				$_SESSION['user'] = $user;
				header('Location: wall.php');		
			}
		}
		else
			header('Location: index.php');
	}

	function logout()
	{
		session_destroy();
		header('Location: index.php');
	}

	function post_action()
	{
		if(!empty($_POST['post']))
		{
			$insert_post_query = "INSERT INTO posts (user_id, content, created_at) VALUES ('". mysql_real_escape_string($_SESSION['user']['id']) ."', '". mysql_real_escape_string($_POST['post']) ."', NOW()) ";
			$insert_post = mysql_query($insert_post_query);

			if($insert_post == TRUE)
				$_SESSION['notifications'][] = "New post inserted!";
			else
				$_SESSION['errors'][] = "Cannot post right now. Please check database connection.";
		}
		else
			$_SESSION['errors'][] = "Post field must not be empty!";

		header('Location: wall.php');
	}

	function comment_action()
	{
		if(!empty($_POST['comment']))
		{
			$insert_comment_query = "INSERT INTO comments (user_id, post_id, content, created_at) VALUES('". mysql_real_escape_string($_SESSION['user']['id']) ."', '". mysql_real_escape_string($_POST['post_id']) ."', '". mysql_real_escape_string($_POST['comment']) ."', NOW()) ";
			$insert_comment = mysql_query($insert_comment_query);

			if($insert_comment == TRUE)
				$_SESSION['notifications'][] = "New comment inserted";
			else
				$_SESSION['errors'][] = "Cannot comment right now. Please check database connection.";
		}
		else
			$_SESSION['errors'][] = "Comment field must not be empty!";

		header('Location: wall.php');
	}
?>