<?php

/**
 * Definition class for table media.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Media_DbTable extends Application_Model_Media_DbTable_Abstract
{
    // write your custom functions here
	function searchAll($searchTerms)
	{
		$yt = new Zend_Gdata_YouTube();
		$yt->setMajorProtocolVersion(2);
		$query = $yt->newVideoQuery();
		$query->setAuthor('daralproject');
		$query->setVideoQuery($searchTerms);
		// Note that we need to pass the version number to the query URL function
		// to ensure backward compatibility with version 1 of the API.
		$videoFeed = $yt->getVideoFeed($query->getQueryUrl(2));
		return $videoFeed;
	}
}