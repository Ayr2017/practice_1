<?php
/**
 * @param string $text
 * @return array
 */
function wordCounter(string $text): array
{
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

    return getTheFirstFive($resultArray) ?? [];

}

/**
 * @param array $wordsArray
 * @return array
 */
function getTheFirstFive(array $wordsArray): array
{
    arsort($wordsArray);
    $output = array_slice($wordsArray, 0, 5);
    return $output; 
}