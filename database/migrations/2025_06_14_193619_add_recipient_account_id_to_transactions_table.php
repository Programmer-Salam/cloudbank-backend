<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->foreignId('recipient_account_id')
                ->nullable()
                ->constrained('accounts')
                ->onDelete('set null'); // Or 'cascade' if you want to delete transactions when account is deleted
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('transactions', function (Blueprint $table) {
            $table->dropForeign(['recipient_account_id']);
            $table->dropColumn('recipient_account_id');
        });
    }
};