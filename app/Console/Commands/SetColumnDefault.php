<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use Illuminate\Support\Facades\DB;
class SetColumnDefault extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:set-column-default';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
public function handle()
{
    try {
        // Step 1: Get all records in order
        $users = DB::table('users')->orderBy('id')->get();
        
        // Step 2: Disable foreign key checks temporarily
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        
        // Step 3: Renumber all IDs sequentially
        $newId = 1;
        foreach ($users as $user) {
            DB::table('users')
                ->where('id', $user->id)
                ->update(['id' => $newId++]);
        }
        
        // Step 4: Reset auto-increment counter
        DB::statement("ALTER TABLE users AUTO_INCREMENT = $newId");
        
        // Step 5: Re-enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
        
        $this->info("Successfully reset IDs to sequential order. Next ID will be: $newId");
        return 0;
        
    } catch (\Exception $e) {
        DB::statement('SET FOREIGN_KEY_CHECKS=1'); // Ensure FK checks are re-enabled
        $this->error("Operation failed: " . $e->getMessage());
        return 1;
    }
}
}
