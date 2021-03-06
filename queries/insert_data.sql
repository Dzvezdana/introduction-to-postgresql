ALTER TABLE president DISABLE TRIGGER ALL;

-- id, name, birth_year, years_served, death_age, party, state_id_born
INSERT INTO president
VALUES (1, 'WASHINGTON G', 1732, 7, 67, 'FEDERALIST', 35);
INSERT INTO president
VALUES (2, 'ADAMS J', 1735, 4, 90, 'FEDERALIST', 38);
INSERT INTO president
VALUES (3, 'JEFFERSON T', 1743, 8, 83, 'DEMO-REP', 35);
INSERT INTO president
VALUES (4, 'MADISON J', 1751, 8, 85, 'DEMO-REP', 35);
INSERT INTO president
VALUES (5, 'MONROE J', 1758, 8, 73, 'DEMO-REP', 35);
INSERT INTO president
VALUES (6, 'ADAMS J Q', 1767, 4, 80, 'DEMO-REP', 38);
INSERT INTO president
VALUES (7, 'JACKSON A', 1767, 8, 78, 'DEMOCRATIC', 40);
INSERT INTO president
VALUES (8, 'VAN BUREN M', 1782, 4, 79, 'DEMOCRATIC', 46);
INSERT INTO president
VALUES (9, 'HARRISON W H', 1773, 0, 68, 'WHIG', 35);
INSERT INTO president
VALUES (10, 'TYLER J', 1790, 3, 71, 'WHIG', 35);
INSERT INTO president
VALUES (11, 'POLK J K', 1795, 4, 53, 'DEMOCRATIC', 47);
INSERT INTO president
VALUES (12, 'TAYLOR Z', 1784, 1, 65, 'WHIG', 35);
INSERT INTO president
VALUES (13, 'FILLMORE M', 1800, 2, 74, 'WHIG', 46);
INSERT INTO president
VALUES (14, 'PIERCE F', 1804, 4, 64, 'DEMOCRATIC', 44);
INSERT INTO president
VALUES (15, 'BUCHANAN J', 1791, 4, 77, 'DEMOCRATIC', 37);
INSERT INTO president
VALUES (16, 'LINCOLN A', 1809, 4, 56, 'REPUBLICAN', 49);
INSERT INTO president
VALUES (17, 'JOHNSON A', 1808, 3, 66, 'DEMOCRATIC', 37);
INSERT INTO president
VALUES (18, 'GRANT U S', 1822, 8, 63, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (19, 'HAYES R B', 1822, 4, 70, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (20, 'GARFIELD J A', 1831, 0, 49, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (21, 'ARTHUR C A', 1830, 3, 56, 'REPUBLICAN', 36);
INSERT INTO president
VALUES (22, 'CLEVELAND G', 1837, 8, 71, 'DEMOCRATIC', 42);
INSERT INTO president
VALUES (23, 'HARRISON B', 1833, 4, 67, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (24, 'MCKINLEY W', 1843, 4, 58, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (25, 'ROOSEVELT T', 1858, 7, 60, 'REPUBLICAN', 46);
INSERT INTO president
VALUES (26, 'TAFT W H', 1857, 4, 72, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (27, 'WILSON W', 1856, 8, 67, 'DEMOCRATIC', 35);
INSERT INTO president
VALUES (28, 'HARDING W G', 1865, 2, 57, 'REPUBLICAN', 1);
INSERT INTO president
VALUES (29, 'COOLIDGE C', 1872, 5, 60, 'REPUBLICAN', 36);
INSERT INTO president
VALUES (30, 'HOOVER H C', 1874, 4, 90, 'REPUBLICAN', 13);
INSERT INTO president
VALUES (31, 'ROOSEVELT F D', 1882, 12, 63, 'DEMOCRATIC', 46);
INSERT INTO president
VALUES (32, 'TRUMAN H S', 1884, 7, 88, 'DEMOCRATIC', 8);
INSERT INTO president
VALUES (33, 'EISENHOWER D D', 1890, 8, 79, 'REPUBLICAN', 12);
INSERT INTO president
VALUES (34, 'KENNEDY J F', 1917, 2, 46, 'DEMOCRATIC', 38);
INSERT INTO president
VALUES (35, 'JOHNSON L B', 1908, 5, 65, 'DEMOCRATIC', 12);
INSERT INTO president
VALUES (36, 'NIXON R M', 1913, 5, 81, 'REPUBLICAN', 15);
INSERT INTO president
VALUES (37, 'FORD G R', 1913, 2, 93, 'REPUBLICAN', 21);
INSERT INTO president
VALUES (38, 'CARTER J M', 1924, 4, NULL, 'DEMOCRATIC', 43);
INSERT INTO president
VALUES (39, 'BUSH G H W', 1924, 4, NULL, 'REPUBLICAN', 38);
INSERT INTO president
VALUES (40, 'REAGAN R', 1911, 8, 93, 'REPUBLICAN', 5);
INSERT INTO president
VALUES (41, 'CLINTON W J', 1946, 8, NULL, 'DEMOCRATIC', 9);
INSERT INTO president
VALUES (42, 'BUSH G W', 1946, 8, NULL, 'REPUBLICAN', 39);
INSERT INTO president
VALUES (43, 'OBAMA B', 1961, 8, NULL, 'DEMOCRATIC', 34);
INSERT INTO president
VALUES (44, 'TRUMP D J', 1946, 0, NULL, 'REPUBLICAN', 46);

SELECT
  SETVAL('president_id_seq', (
    SELECT MAX(id)
    FROM president), TRUE);

ALTER TABLE president ENABLE TRIGGER ALL;

-- id, name, admin_id, year_entered
INSERT INTO state
VALUES (1, 'OHIO', 1803);
INSERT INTO state
VALUES (2, 'LOUISIANNA', 1812);
INSERT INTO state
VALUES (3, 'INDIANA', 1816);
INSERT INTO state
VALUES (4, 'MISSISSIPI', 1817);
INSERT INTO state
VALUES (5, 'ILLINOIS', 1818);
INSERT INTO state
VALUES (6, 'ALABAMA', 1819);
INSERT INTO state
VALUES (7, 'MAINE', 1820);
INSERT INTO state
VALUES (8, 'MISSOURI', 1821);
INSERT INTO state
VALUES (9, 'ARKANSAS', 1836);
INSERT INTO state
VALUES (10, 'MICHIGAN', 1837);
INSERT INTO state
VALUES (11, 'FLORIDA', 1845);
INSERT INTO state
VALUES (12, 'TEXAS', 1845);
INSERT INTO state
VALUES (13, 'IOWA', 1846);
INSERT INTO state
VALUES (14, 'WISCONSIN', 1848);
INSERT INTO state
VALUES (15, 'CALIFORNIA', 1850);
INSERT INTO state
VALUES (16, 'MINNESOTA', 1858);
INSERT INTO state
VALUES (17, 'OREGON', 1859);
INSERT INTO state
VALUES (18, 'KANSAS', 1861);
INSERT INTO state
VALUES (19, 'WEST VIRGINIA', 1863);
INSERT INTO state
VALUES (20, 'NEVADA', 1864);
INSERT INTO state
VALUES (21, 'NEBRASKA', 1867);
INSERT INTO state
VALUES (22, 'COLORADO', 1876);
INSERT INTO state
VALUES (23, 'NORTH DAKOTA', 1889);
INSERT INTO state
VALUES (24, 'SOUTH DAKOTA', 1889);
INSERT INTO state
VALUES (25, 'MONTANA', 1889);
INSERT INTO state
VALUES (26, 'WASHINGTON', 1889);
INSERT INTO state
VALUES (27, 'IDAHO', 1890);
INSERT INTO state
VALUES (28, 'WYOMING', 1890);
INSERT INTO state
VALUES (29, 'UTAH', 1896);
INSERT INTO state
VALUES (30, 'OKLAHOMA', 1907);
INSERT INTO state
VALUES (31, 'NEW MEXICO', 1912);
INSERT INTO state
VALUES (32, 'ARIZONA', 1912);
INSERT INTO state
VALUES (33, 'ALASKA', 1959);
INSERT INTO state
VALUES (34, 'HAWAII', 1959);
INSERT INTO state
VALUES (35, 'VIRGINIA', 1776);
INSERT INTO state
VALUES (36, 'VERMONT', 1791);
INSERT INTO state
VALUES (37, 'PENNSYLVANIA', 1776);
INSERT INTO state
VALUES (38, 'MASSACHUSETTS', 1776);
INSERT INTO state
VALUES (39, 'CONNECTICUT', 1776);
INSERT INTO state
VALUES (40, 'SOUTH CAROLINA', 1776);
INSERT INTO state
VALUES (41, 'MARYLAND', 1776);
INSERT INTO state
VALUES (42, 'NEW JERSEY', 1776);
INSERT INTO state
VALUES (43, 'GEORGIA', 1776);
INSERT INTO state
VALUES (44, 'NEW HAMPSHIRE', 1776);
INSERT INTO state
VALUES (45, 'DELAWARE', 1776);
INSERT INTO state
VALUES (46, 'NEW YORK', 1776);
INSERT INTO state
VALUES (47, 'NORTH CAROLINA', 1776);
INSERT INTO state
VALUES (48, 'RHODE ISLAND', 1776);
INSERT INTO state
VALUES (49, 'KENTUCKY', 1792);
INSERT INTO state
VALUES (50, 'TENNESSEE', 1796);

SELECT
  SETVAL('state_id_seq', (
    SELECT MAX(id)
    FROM state), TRUE);

ALTER TABLE state ENABLE TRIGGER ALL;
ALTER TABLE pres_hobby DISABLE TRIGGER ALL;

-- pres_id, hobby
INSERT INTO pres_hobby
VALUES (6, 'BILLIARDS');
INSERT INTO pres_hobby
VALUES (6, 'SWIMMING');
INSERT INTO pres_hobby
VALUES (21, 'FISHING');
INSERT INTO pres_hobby
VALUES (22, 'FISHING');
INSERT INTO pres_hobby
VALUES (29, 'FISHING');
INSERT INTO pres_hobby
VALUES (29, 'GOLF');
INSERT INTO pres_hobby
VALUES (29, 'INDIAN CLUBS');
INSERT INTO pres_hobby
VALUES (29, 'MECH. HORS');
INSERT INTO pres_hobby
VALUES (29, 'PITCHING HAY');
INSERT INTO pres_hobby
VALUES (33, 'BRIDGE');
INSERT INTO pres_hobby
VALUES (33, 'GOLF');
INSERT INTO pres_hobby
VALUES (33, 'HUNTING');
INSERT INTO pres_hobby
VALUES (33, 'PAINTING');
INSERT INTO pres_hobby
VALUES (33, 'FISHING');
INSERT INTO pres_hobby
VALUES (20, 'BILLIARDS');
INSERT INTO pres_hobby
VALUES (28, 'GOLF');
INSERT INTO pres_hobby
VALUES (28, 'POKER');
INSERT INTO pres_hobby
VALUES (28, 'RIDING');
INSERT INTO pres_hobby
VALUES (23, 'HUNTING');
INSERT INTO pres_hobby
VALUES (19, 'CROQUET');
INSERT INTO pres_hobby
VALUES (19, 'DRIVING');
INSERT INTO pres_hobby
VALUES (19, 'SHOOTING');
INSERT INTO pres_hobby
VALUES (30, 'FISHING');
INSERT INTO pres_hobby
VALUES (30, 'MEDICINE BALL');
INSERT INTO pres_hobby
VALUES (7, 'RIDING');
INSERT INTO pres_hobby
VALUES (3, 'FISHING');
INSERT INTO pres_hobby
VALUES (3, 'RIDING');
INSERT INTO pres_hobby
VALUES (35, 'RIDING');
INSERT INTO pres_hobby
VALUES (34, 'SAILING');
INSERT INTO pres_hobby
VALUES (34, 'SWIMMING');
INSERT INTO pres_hobby
VALUES (34, 'TOUCH FOOTBALL');
INSERT INTO pres_hobby
VALUES (16, 'WALKING');
INSERT INTO pres_hobby
VALUES (24, 'RIDING');
INSERT INTO pres_hobby
VALUES (24, 'SWIMMING');
INSERT INTO pres_hobby
VALUES (24, 'WALKING');
INSERT INTO pres_hobby
VALUES (36, 'GOLF');
INSERT INTO pres_hobby
VALUES (31, 'FISHING');
INSERT INTO pres_hobby
VALUES (31, 'SAILING');
INSERT INTO pres_hobby
VALUES (31, 'SWIMMING');
INSERT INTO pres_hobby
VALUES (25, 'BOXING');
INSERT INTO pres_hobby
VALUES (25, 'HUNTING');
INSERT INTO pres_hobby
VALUES (25, 'JUJITSU');
INSERT INTO pres_hobby
VALUES (25, 'RIDING');
INSERT INTO pres_hobby
VALUES (25, 'SHOOTING');
INSERT INTO pres_hobby
VALUES (25, 'TENNIS');
INSERT INTO pres_hobby
VALUES (25, 'WRESTLING');
INSERT INTO pres_hobby
VALUES (26, 'GOLF');
INSERT INTO pres_hobby
VALUES (26, 'RIDING');
INSERT INTO pres_hobby
VALUES (12, 'RIDING');
INSERT INTO pres_hobby
VALUES (32, 'FISHING');
INSERT INTO pres_hobby
VALUES (32, 'POKER');
INSERT INTO pres_hobby
VALUES (32, 'WALKING');
INSERT INTO pres_hobby
VALUES (8, 'RIDING');
INSERT INTO pres_hobby
VALUES (1, 'FISHING');
INSERT INTO pres_hobby
VALUES (1, 'RIDING');
INSERT INTO pres_hobby
VALUES (27, 'GOLF');
INSERT INTO pres_hobby
VALUES (27, 'RIDING');
INSERT INTO pres_hobby
VALUES (27, 'WALKING');
INSERT INTO pres_hobby
VALUES (6, 'WALKING');
INSERT INTO pres_hobby
VALUES (40, 'GOLF');
INSERT INTO pres_hobby
VALUES (43, 'COIKING');
INSERT INTO pres_hobby
VALUES (43, 'BASKETBALL');
INSERT INTO pres_hobby
VALUES (43, 'DANCING');
INSERT INTO pres_hobby
VALUES (41, 'PLAYING SAXOPHONE');
INSERT INTO pres_hobby
VALUES (42, 'FISHING');
INSERT INTO pres_hobby
VALUES (42, 'JOGGING');
INSERT INTO pres_hobby
VALUES (39, 'FISHING');
INSERT INTO pres_hobby
VALUES (44, 'GOLF');


ALTER TABLE pres_hobby ENABLE TRIGGER ALL;
ALTER TABLE pres_marriage DISABLE TRIGGER ALL;

-- pres_id, spouse_name, spouse_age, nr_children, marriage_year

INSERT INTO pres_marriage
VALUES (1, 'CUSTIS M D', 27, 0, 1759);
INSERT INTO pres_marriage
VALUES (2, 'SMITH A', 19, 5, 1764);
INSERT INTO pres_marriage
VALUES (3, 'SKELTON M W', 23, 6, 1772);
INSERT INTO pres_marriage
VALUES (4, 'TODD D D P', 26, 0, 1794);
INSERT INTO pres_marriage
VALUES (5, 'KORTRIGHT E', 17, 3, 1786);
INSERT INTO pres_marriage
VALUES (6, 'JOHNSON L C', 22, 4, 1797);
INSERT INTO pres_marriage
VALUES (7, 'ROBARDS R D', 26, 0, 1794);
INSERT INTO pres_marriage
VALUES (8, 'HOOS H', 23, 4, 1807);
INSERT INTO pres_marriage
VALUES (9, 'SYMMES A T', 20, 10, 1795);
INSERT INTO pres_marriage
VALUES (10, 'CHRISTIAN L', 22, 8, 1813);
INSERT INTO pres_marriage
VALUES (10, 'GARDINER J', 24, 7, 1844);
INSERT INTO pres_marriage
VALUES (11, 'CHILDRESS S', 20, 0, 1824);
INSERT INTO pres_marriage
VALUES (12, 'SMITH M M', 21, 6, 1810);
INSERT INTO pres_marriage
VALUES (13, 'POWERS A', 27, 2, 1826);
INSERT INTO pres_marriage
VALUES (13, 'MCINTOSH C C', 44, 0, 1858);
INSERT INTO pres_marriage
VALUES (14, 'APPLETON J M', 28, 3, 1834);
INSERT INTO pres_marriage
VALUES (16, 'TODD M', 23, 4, 1842);
INSERT INTO pres_marriage
VALUES (17, 'MCCARDLE E', 16, 5, 1827);
INSERT INTO pres_marriage
VALUES (18, 'DENT J B', 22, 4, 1848);
INSERT INTO pres_marriage
VALUES (19, 'WEBB L W', 21, 8, 1852);
INSERT INTO pres_marriage
VALUES (20, 'RUDOLPH L', 26, 7, 1858);
INSERT INTO pres_marriage
VALUES (21, 'HERNDON E L', 22, 3, 1859);
INSERT INTO pres_marriage
VALUES (22, 'FOLSON F', 21, 5, 1886);
INSERT INTO pres_marriage
VALUES (23, 'SCOTT C L', 31, 2, 1853);
INSERT INTO pres_marriage
VALUES (23, 'DIMMICK M S L', 37, 1, 1896);
INSERT INTO pres_marriage
VALUES (24, 'SAXTON I', 23, 2, 1871);
INSERT INTO pres_marriage
VALUES (25, 'LEE A H', 19, 1, 1880);
INSERT INTO pres_marriage
VALUES (25, 'CARROW E K', 25, 5, 1886);
INSERT INTO pres_marriage
VALUES (26, 'HERRON H', 25, 3, 1886);
INSERT INTO pres_marriage
VALUES (27, 'AXSON E L', 25, 3, 1885);
INSERT INTO pres_marriage
VALUES (27, 'GALT E B', 43, 0, 1915);
INSERT INTO pres_marriage
VALUES (28, 'DE WOLFE F K', 30, 0, 1891);
INSERT INTO pres_marriage
VALUES (29, 'GOODHUE G A', 26, 2, 1905);
INSERT INTO pres_marriage
VALUES (30, 'HENRY L', 23, 2, 1899);
INSERT INTO pres_marriage
VALUES (31, 'ROOSEVELT A E', 20, 6, 1905);
INSERT INTO pres_marriage
VALUES (32, 'WALLACE E V', 34, 1, 1919);
INSERT INTO pres_marriage
VALUES (33, 'DOUD G', 19, 2, 1916);
INSERT INTO pres_marriage
VALUES (34, 'BOUVIER J L', 24, 3, 1953);
INSERT INTO pres_marriage
VALUES (35, 'TAYLOR C A', 21, 2, 1934);
INSERT INTO pres_marriage
VALUES (36, 'RYAN T C', 28, 2, 1940);
INSERT INTO pres_marriage
VALUES (37, 'WARREN E B', 30, 4, 1948);
INSERT INTO pres_marriage
VALUES (38, 'SMITH R', 18, 4, 1946);
INSERT INTO pres_marriage
VALUES (40, 'WYMAN J', 25, 2, 1940);
INSERT INTO pres_marriage
VALUES (40, 'DAVIS N', 28, 2, 1952);
INSERT INTO pres_marriage
VALUES (39, 'PIERCE B', 20, 6, 1945);
INSERT INTO pres_marriage
VALUES (42, 'WELCH L L', 31, 2, 1977);
INSERT INTO pres_marriage
VALUES (43, 'ROBINSON M', 28, 2, 1992);
INSERT INTO pres_marriage
VALUES (41, 'RODHAM H', 28, 1, 1975);
INSERT INTO pres_marriage
VALUES (44, 'ZELNICKOVA I', 28, 3, 1977);
INSERT INTO pres_marriage
VALUES (44, 'MAPLES M', 30, 1, 1993);
INSERT INTO pres_marriage
VALUES (44, 'KNAUSS M', 34, 1, 2005);

ALTER TABLE pres_marriage ENABLE TRIGGER ALL;
ALTER TABLE election DISABLE TRIGGER ALL;

-- election_year, candidate, votes, vinner_loser_indic

INSERT INTO election
VALUES (1789, 'WASHINGTON G', 69, 'W');
INSERT INTO election
VALUES (1789, 'ADAMS J', 34, 'L');
INSERT INTO election
VALUES (1789, 'JAY J', 9, 'L');
INSERT INTO election
VALUES (1789, 'HARRISON R H', 6, 'L');
INSERT INTO election
VALUES (1789, 'RUTLEDGE J', 6, 'L');
INSERT INTO election
VALUES (1789, 'HANCOCK J', 4, 'L');
INSERT INTO election
VALUES (1789, 'CLINTON G', 3, 'L');
INSERT INTO election
VALUES (1789, 'HUNTINGTON S', 2, 'L');
INSERT INTO election
VALUES (1789, 'MILTON J', 2, 'L');
INSERT INTO election
VALUES (1789, 'ARMSTRONG', 1, 'L');
INSERT INTO election
VALUES (1789, 'LINCOLN B', 1, 'L');
INSERT INTO election
VALUES (1789, 'TOLFAIR I', 1, 'L');
INSERT INTO election
VALUES (1792, 'ADAMS J', 77, 'L');
INSERT INTO election
VALUES (1792, 'CLINTON G', 50, 'L');
INSERT INTO election
VALUES (1792, 'JEFFERSON T', 4, 'L');
INSERT INTO election
VALUES (1796, 'PINCKNEY T', 59, 'L');
INSERT INTO election
VALUES (1792, 'BURR A', 1, 'L');
INSERT INTO election
VALUES (1796, 'ADAMS J', 71, 'W');
INSERT INTO election
VALUES (1796, 'JEFFERSON T', 68, 'L');
INSERT INTO election
VALUES (1796, 'BURR A', 30, 'L');
INSERT INTO election
VALUES (1796, 'CLINTON G', 7, 'L');
INSERT INTO election
VALUES (1796, 'JAY J', 5, 'L');
INSERT INTO election
VALUES (1796, 'IREDELL J', 3, 'L');
INSERT INTO election
VALUES (1796, 'HENRY J', 2, 'L');
INSERT INTO election
VALUES (1796, 'JOHNSON S', 2, 'L');
INSERT INTO election
VALUES (1796, 'WASHINGTON G', 2, 'L');
INSERT INTO election
VALUES (1796, 'PINCKNEY C C', 1, 'L');
INSERT INTO election
VALUES (1792, 'WASHINGTON G', 132, 'W');
INSERT INTO election
VALUES (1796, 'ADAMS S', 15, 'L');
INSERT INTO election
VALUES (1796, 'ELLSWORTH O', 11, 'L');
INSERT INTO election
VALUES (1800, 'JEFFERSON T', 73, 'W');
INSERT INTO election
VALUES (1800, 'BURR A', 73, 'L');
INSERT INTO election
VALUES (1800, 'ADAMS J', 65, 'L');
INSERT INTO election
VALUES (1800, 'JAY J', 1, 'L');
INSERT INTO election
VALUES (1804, 'JEFFERSON T', 162, 'W');
INSERT INTO election
VALUES (1804, 'PINCKNEY C C', 14, 'L');
INSERT INTO election
VALUES (1800, 'PINCKNEY C C', 64, 'L');
INSERT INTO election
VALUES (1808, 'MADISON J', 122, 'W');
INSERT INTO election
VALUES (1808, 'PINCKNEY C C', 47, 'L');
INSERT INTO election
VALUES (1808, 'CLINTON G', 6, 'L');
INSERT INTO election
VALUES (1812, 'MADISON J', 128, 'W');
INSERT INTO election
VALUES (1812, 'CLINTON G', 89, 'L');
INSERT INTO election
VALUES (1816, 'MONROE J', 183, 'W');
INSERT INTO election
VALUES (1816, 'KING R', 34, 'L');
INSERT INTO election
VALUES (1820, 'MONROE J', 231, 'W');
INSERT INTO election
VALUES (1820, 'ADAMS J Q', 1, 'L');
INSERT INTO election
VALUES (1824, 'ADAMS J Q', 99, 'W');
INSERT INTO election
VALUES (1824, 'JACKSON A', 84, 'L');
INSERT INTO election
VALUES (1824, 'CRAWFORD W H', 41, 'L');
INSERT INTO election
VALUES (1824, 'CLAY H', 37, 'L');
INSERT INTO election
VALUES (1828, 'JACKSON A', 178, 'W');
INSERT INTO election
VALUES (1828, 'ADAMS J', 83, 'L');
INSERT INTO election
VALUES (1832, 'JACKSON A', 219, 'W');
INSERT INTO election
VALUES (1832, 'CLAY H', 49, 'L');
INSERT INTO election
VALUES (1832, 'FLOYD J', 11, 'L');
INSERT INTO election
VALUES (1832, 'WIRT W', 7, 'L');
INSERT INTO election
VALUES (1836, 'VAN BUREN M', 170, 'W');
INSERT INTO election
VALUES (1836, 'HARRISON W H', 73, 'L');
INSERT INTO election
VALUES (1836, 'WHITE H L', 26, 'L');
INSERT INTO election
VALUES (1836, 'WEBSTER D', 14, 'L');
INSERT INTO election
VALUES (1836, 'MANGUM W P', 11, 'L');
INSERT INTO election
VALUES (1840, 'HARRISON W H', 234, 'W');
INSERT INTO election
VALUES (1840, 'VAN BUREN M', 60, 'L');
INSERT INTO election
VALUES (1844, 'POLK J K', 170, 'W');
INSERT INTO election
VALUES (1844, 'CLAY H', 105, 'L');
INSERT INTO election
VALUES (1848, 'TAYLOR Z', 163, 'W');
INSERT INTO election
VALUES (1848, 'CASS L', 126, 'L');
INSERT INTO election
VALUES (1852, 'PIERCE F', 254, 'W');
INSERT INTO election
VALUES (1852, 'SCOTT W', 42, 'L');
INSERT INTO election
VALUES (1856, 'BUCHANAN J', 174, 'W');
INSERT INTO election
VALUES (1856, 'FREMONT J C', 114, 'L');
INSERT INTO election
VALUES (1856, 'FILLMORE M', 8, 'L');
INSERT INTO election
VALUES (1860, 'LINCOLN A', 180, 'W');
INSERT INTO election
VALUES (1860, 'BRECKINRIDGE J C', 72, 'L');
INSERT INTO election
VALUES (1860, 'BELL J', 39, 'L');
INSERT INTO election
VALUES (1860, 'DOUGLAS S', 12, 'L');
INSERT INTO election
VALUES (1864, 'LINCOLN A', 212, 'W');
INSERT INTO election
VALUES (1864, 'MCCLELLAN G B', 21, 'L');
INSERT INTO election
VALUES (1868, 'GRANT U S', 214, 'W');
INSERT INTO election
VALUES (1868, 'SEYMOUR H', 80, 'L');
INSERT INTO election
VALUES (1872, 'GRANT U S', 286, 'W');
INSERT INTO election
VALUES (1872, 'HENDRICKS T A', 42, 'L');
INSERT INTO election
VALUES (1872, 'BROWN B G', 18, 'L');
INSERT INTO election
VALUES (1872, 'JENKINS C J', 2, 'L');
INSERT INTO election
VALUES (1872, 'DAVIS D', 1, 'L');
INSERT INTO election
VALUES (1876, 'HAYES R B', 185, 'W');
INSERT INTO election
VALUES (1876, 'TILDEN R B', 184, 'L');
INSERT INTO election
VALUES (1880, 'GARFIELD J A', 214, 'W');
INSERT INTO election
VALUES (1880, 'HANCOCK W S', 155, 'L');
INSERT INTO election
VALUES (1884, 'CLEVELAND G', 219, 'W');
INSERT INTO election
VALUES (1884, 'BLAINE J G', 182, 'L');
INSERT INTO election
VALUES (1888, 'HARRISON B', 233, 'W');
INSERT INTO election
VALUES (1888, 'CLEVELAND G', 168, 'L');
INSERT INTO election
VALUES (1892, 'CLEVELAND G', 277, 'W');
INSERT INTO election
VALUES (1892, 'HARRISON B', 145, 'L');
INSERT INTO election
VALUES (1892, 'WEAVER J B', 22, 'L');
INSERT INTO election
VALUES (1896, 'MCKINLEY W', 271, 'W');
INSERT INTO election
VALUES (1896, 'BRYAN W J', 176, 'L');
INSERT INTO election
VALUES (1900, 'MCKINLEY W', 292, 'W');
INSERT INTO election
VALUES (1900, 'BRYAN W J', 155, 'L');
INSERT INTO election
VALUES (1904, 'ROOSEVELT T', 336, 'W');
INSERT INTO election
VALUES (1904, 'PARKER E B', 140, 'L');
INSERT INTO election
VALUES (1908, 'TAFT W H', 321, 'W');
INSERT INTO election
VALUES (1908, 'BRYAN W J', 162, 'L');
INSERT INTO election
VALUES (1912, 'WILSON W', 435, 'W');
INSERT INTO election
VALUES (1912, 'ROOSEVELT T', 88, 'L');
INSERT INTO election
VALUES (1912, 'TAFT W H', 8, 'L');
INSERT INTO election
VALUES (1916, 'WILSON W', 277, 'W');
INSERT INTO election
VALUES (1916, 'HUGHES C E', 254, 'L');
INSERT INTO election
VALUES (1920, 'HARDING W G', 404, 'W');
INSERT INTO election
VALUES (1920, 'COX W W', 127, 'L');
INSERT INTO election
VALUES (1924, 'COOLIDGE C', 382, 'W');
INSERT INTO election
VALUES (1924, 'DAVIS J W', 136, 'L');
INSERT INTO election
VALUES (1924, 'LA FOLLETTE R M', 13, 'L');
INSERT INTO election
VALUES (1928, 'HOOVER H C', 444, 'W');
INSERT INTO election
VALUES (1928, 'SMITH A E', 87, 'L');
INSERT INTO election
VALUES (1932, 'ROOSEVELT F D', 472, 'W');
INSERT INTO election
VALUES (1932, 'HOOVER H C', 49, 'L');
INSERT INTO election
VALUES (1936, 'ROOSEVELT F D', 523, 'W');
INSERT INTO election
VALUES (1936, 'LANDON A M', 8, 'L');
INSERT INTO election
VALUES (1940, 'ROOSEVELT F D', 449, 'W');
INSERT INTO election
VALUES (1940, 'WILKIE W L', 82, 'L');
INSERT INTO election
VALUES (1944, 'ROOSEVELT F D', 432, 'W');
INSERT INTO election
VALUES (1944, 'DEWEY T E', 99, 'L');
INSERT INTO election
VALUES (1948, 'TRUMAN H S', 303, 'W');
INSERT INTO election
VALUES (1948, 'DEWEY T E', 189, 'L');
INSERT INTO election
VALUES (1948, 'THURMOND J S', 39, 'L');
INSERT INTO election
VALUES (1952, 'EISENHOWER D D', 442, 'W');
INSERT INTO election
VALUES (1952, 'STEVENSON A E', 89, 'L');
INSERT INTO election
VALUES (1956, 'EISENHOWER D D', 457, 'W');
INSERT INTO election
VALUES (1956, 'STEVENSON A E', 73, 'L');
INSERT INTO election
VALUES (1956, 'JONES W B', 1, 'L');
INSERT INTO election
VALUES (1960, 'KENNEDY J F', 303, 'W');
INSERT INTO election
VALUES (1960, 'NIXON R M', 219, 'L');
INSERT INTO election
VALUES (1960, 'BYRD', 15, 'L');
INSERT INTO election
VALUES (1964, 'JOHNSON L B', 486, 'W');
INSERT INTO election
VALUES (1964, 'GOLDWATER B', 52, 'L');
INSERT INTO election
VALUES (1968, 'NIXON R M', 301, 'W');
INSERT INTO election
VALUES (1968, 'HUMPHREY H H', 191, 'L');
INSERT INTO election
VALUES (1968, 'WALLACE G C', 46, 'L');
INSERT INTO election
VALUES (1972, 'NIXON R M', 520, 'W');
INSERT INTO election
VALUES (1972, 'MCGOVERN G S', 17, 'L');
INSERT INTO election
VALUES (1972, 'HOSPERS J', 1, 'L');
INSERT INTO election
VALUES (1976, 'CARTER J M', 297, 'W');
INSERT INTO election
VALUES (1976, 'FORD G R', 240, 'L');
INSERT INTO election
VALUES (1980, 'CARTER J M', 49, 'L');
INSERT INTO election
VALUES (1980, 'REAGAN R', 489, 'W');
INSERT INTO election
VALUES (1988, 'BUSH G H W', 426, 'W');
INSERT INTO election
VALUES (1988, 'DUKAKIS M', 111, 'L');
INSERT INTO election
VALUES (1992, 'CLINTON W J', 370, 'W');
INSERT INTO election
VALUES (1992, 'BUSH G H W', 168, 'L');
INSERT INTO election
VALUES (1996, 'CLINTON W J', 379, 'W');
INSERT INTO election
VALUES (1996, 'DOLE B', 159, 'L');
INSERT INTO election
VALUES (2000, 'BUSH G W', 271, 'W');
INSERT INTO election
VALUES (2000, 'GORE A', 266, 'L');
INSERT INTO election
VALUES (2004, 'BUSH G W', 286, 'W');
INSERT INTO election
VALUES (2004, 'KERRY J', 251, 'L');
INSERT INTO election
VALUES (2008, 'OBAMA B', 365, 'W');
INSERT INTO election
VALUES (2008, 'MCCAIN J', 173, 'L');
-- updated 26.09.2014
INSERT INTO election
VALUES (2012, 'OBAMA B', 332, 'W');
INSERT INTO election
VALUES (2012, 'ROMNEY M', 206, 'L');
INSERT INTO election
VALUES (2016, 'TRUMP D J', 304, 'W');
INSERT INTO election
VALUES (2016, 'CLINTON H D R', 227, 'L');

ALTER TABLE election ENABLE TRIGGER ALL;