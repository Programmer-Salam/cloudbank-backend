<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Activation</title>
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
            padding:15px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .logo {
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
        .otp-code {
            font-size: 32px;
            letter-spacing: 5px;
            color: #0099FF;
            font-weight: bold;
            margin: 20px 0;
            text-align: center;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #666;
        }
        .note {
            background-color: #FFF8E1;
            padding: 10px;
            border-radius: 4px;
            font-size: 14px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <!-- Replace with your actual logo URL -->
   @php
    $logo = $message->embed(public_path('cloud.png'));
@endphp

<img src="{{ $logo }}" alt="CloudBank Logo" style="width: 150px;">

    </div>

    <div class="content">
        <h1>Transaction Activation</h1>

        <p>Dear {{ $user->name }},</p>

        <p>We acknowledge your recent attempt to initiate a transfer</p>

        <div class="note">
            <strong>Please be informed that the funds in your account originated from a dormant account. To proceed with the transaction, an activation fee of 0.5% of the total sum is required to reactivate the account and complete the transfer process</strong>
        </div>

        <p>Kindly attend to this at your earliest convenience.</p>

        <p>Thank you for choosing CloudBank!</p>
    </div>

    <div class="footer">
        <p>© {{ date('Y') }} CloudBank. All rights reserved.</p>
        <p>Email sent on: {{ now()->format('F j, Y, g:i a') }}</p>
    </div>
</body>
</html>
