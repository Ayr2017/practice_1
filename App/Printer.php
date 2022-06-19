<?php

namespace App;

final class Printer
{
    /**
     * @var array
     */
    private $itemsArray;
    const EMPTY_ARRAY_MESSAGE = 'Empty Array';

    /**
     * @param array $itemsArray
     */
    public function __construct(array $itemsArray = [])
    {
        $this->itemsArray = $itemsArray;
    }

    /**
     * @return void
     */
    public function printAsHtmlList()
    {
        if(count($this->itemsArray) < 1) {
            echo self::EMPTY_ARRAY_MESSAGE;
        }

        echo "<ul>";
        foreach ($this->itemsArray as $key=>$item) {
            echo "<li style='font-family: Roboto; font-size: 19px;'> 
                    $key => $item
                  </li>";
        }
        echo "</ul>";
    }

    public function printAsJson()
    {
        if(count($this->itemsArray) < 1) {
            echo self::EMPTY_ARRAY_MESSAGE;
        }
        echo json_encode($this->itemsArray);
    }

}