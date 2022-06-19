<?php

include_once './autoloader.php';

use App\WordsCounter;
use PHPUnit\Framework\TestCase;

class WordsCounterTest extends TestCase
{

    private $wordsCounter;

    protected function setUp():void
    {
        $this->wordsCounter = new WordsCounter('./store/text.txt');
    }

    protected function tearDown():void
    {
        $this->wordsCounter = NULL;
    }


    public function testGetTheFirstFiveItemsFromParam()
    {
        $text = 'first first second second second';
        $result = $this->wordsCounter->getTheFirstFiveItemsFromParam($text);
        $this->assertEquals([
            'second'=>3,
            'first'=>2
        ], $result);
    }

    public function testGetTheFirstFiveItems()
    {
        $this->wordsCounter->getTheFirstFiveItems();
    }

}
