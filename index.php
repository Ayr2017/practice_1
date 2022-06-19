<?php
include_once './autoloader.php';

use App\WordsCounter;
use App\Printer;


$wc = new WordsCounter("./store/text.txt");

//возвращает массив
$items = $wc->getTheFirstFiveItems();


$printer = new Printer($items);
$printer->printAsHtmlList();


#------------------
//PROCEDURE STYLE
//include_once 'Text.php';
//include_once 'WordCounter.php';
//
//$items = wordCounter($text);
//print_r($items);

