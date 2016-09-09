-- ================================================================================================
-- = Hive - WindowingAndAnalytics
-- = @see https://cwiki.apache.org/confluence/display/Hive/LanguageManual+WindowingAndAnalytics
-- ================================================================================================

-- =========================================================
-- |  userid  |--------|  artistid  |--------|  playcount  |
-- =========================================================
-- 
--

-- OVER with a PARTITION BY statement
-- ------------------------------------------------------------------------------------------------------------
SELECT artistid, COUNT(artistid) as total FROM user_artist_data  GROUP BY artistid ORDER BY total DESC;

SELECT artistid, COUNT(artistid) as total OVER (PARTITION BY artistid order by total) FROM user_artist_data;
-- ------------------------------------------------------------------------------------------------------------

-- OVER with PARTITION BY and ORDER BY 
-- ------------------------------------------------------------------------------------------------------------
SELECT artistid, COUNT(artistid) OVER (PARTITION BY artistid ORDER BY artistid) FROM user_artist_data;
-- ------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------------------------
SELECT artistid, COUNT(artistid) ROW_NUMBER OVER (PARTITION BY artistid ORDER BY artistid) FROM user_artist_data;
-- ------------------------------------------------------------------------------------------------------------

-- Return Top in in some patitions
SELECT * FROM (
  SELECT artistid, userid, playcount,  ROW_NUMBER() OVER (partition BY artistid ORDER BY playcount DESC) as row_num FROM user_artist_data WHERE artistid IN ('1', '1000113', '1000130', '1000429') 
) t WHERE row_num < 3;