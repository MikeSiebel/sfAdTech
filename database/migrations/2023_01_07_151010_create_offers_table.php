<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('offers', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name', 255)->unique(); // name
            $table->text('subjects', 254)->nullable(); // Topics
            $table->foreignId('advertiser_id') // from whom offer
                ->nullable()
                ->constrained('users')
                ->cascadeOnUpdate()
                ->nullOnDelete();
            $table->text('url', 2048); // link to go
            $table->decimal('price', 14, 2)->default(0); // transition cost
            $table->boolean('active')->default(false); // Sign "Offer is active"
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('offers');
    }
}
