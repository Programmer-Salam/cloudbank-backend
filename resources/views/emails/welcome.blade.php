<!-- resources/views/emails/welcome.blade.php -->
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to CloudBank</title>
    <style>
        body {
            font-family: 'Inter', Arial, sans-serif;
            line-height: 1.6;
            color: #1C1C1C;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #F4F6F8;
        }
        .header {
            background-color: #0052CC;
            padding: 15px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .header img {
            height: 40px;
        }
        .content {
            background-color: white;
            padding: 30px;
            border-radius: 0 0 8px 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #0052CC;
            margin-top: 0;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #0099FF;
            color: white !important;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            margin: 20px 0;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <!-- Replace with your logo URL -->
        @php
    $logo = $message->embed(public_path('cloud.png'));
@endphp

<img src="{{ $logo }}" alt="CloudBank Logo" style="width: 150px;">
    </div>

    <div class="content">
        <h1>Welcome to CloudBank, {{ $user->name }}!</h1>

        <p>Thank you for verifying your email address. Your account is now fully activated and ready to use.</p>

        <p>With CloudBank, you can:</p>
        <ul>
            <li>Securely transfer funds to other accounts</li>
            <li>View your transaction history</li>
            <li>Get real-time notifications</li>
            <li>Manage your profile settings</li>
        </ul>

        <a href="{{ config('app.url') }}" class="button">Start Banking Now</a>

        <p>If you have any questions, please contact our support team at support@cloudbank.com.</p>

        <p>Happy banking!</p>
        <p><strong>The CloudBank Team</strong></p>
    </div>

    <div class="footer">
        <p>© {{ date('Y') }} CloudBank. All rights reserved.</p>
        <p>Email sent on: {{ now()->format('F j, Y, g:i a') }}</p>
        <p>Address: 123 Banking Street, Lagos, Nigeria</p>
    </div>
</body>
</html>
