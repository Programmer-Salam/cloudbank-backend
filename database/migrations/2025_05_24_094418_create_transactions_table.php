<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
      Schema::create('transactions', function (Blueprint $table) {
    $table->id();
    $table->foreignId('account_id')->constrained()->cascadeOnDelete();
    $table->integer('recipient_account_id')->nullable();
    $table->decimal('amount', 15, 2);
    $table->string('type'); // credit, debit, transfer
    $table->string('status')->default('pending'); // pending, completed, failed
    $table->string('description')->nullable();
    $table->string('software_description');
    $table->string('reference')->unique();
    $table->foreignId('admin_id')->nullable()->constrained('users');
    $table->timestamp('completed_at')->nullable();
    $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
