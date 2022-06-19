<?php

namespace App;

final class WordsCounter
{

    private $text = "";

    /**
     * @param $path
     */
    public function __construct($path)
    {
        $this->text = file_get_contents($path);
    }

    /**
     * @return void
     */
    public function printText()
    {
        print($this->text);
    }

    /**
     * @return array
     */
    public function getTheFirstFiveItems(): array
    {
        $text = $this->text;
        if(strlen($text)<1) {
            return [];
        }

        $preparedText = str_replace( ["#", "'","\"", ";", ",", "!", "?", ":", "-", "."], '', $text);
        $textArray = explode(' ', $preparedText);
        $resultArray = [];

        foreach($textArray as $item){
            if (array_key_exists($item, $resultArray)) {
                $resultArray[$item]++;
            } else {
                $resultArray[$item] = 1;
            }
        }

        return $this->sliceWordsArray($resultArray) ?? [];

    }


    /**
     * @param array $wordsArray
     * @return array
     */
    private function sliceWordsArray(array $wordsArray): array
    {
        arsort($wordsArray);
        $output = array_slice($wordsArray, 0, 5);
        return $output;
    }


}