mysql> use chevaux;
Database changed

mysql> select * from personne;
+-------------+---------+---------+--------------+------------+---------------+--------------+
| id_personne | nom     | prenom  | adresse      | telephone  | fonction      | id_Encadrant |
+-------------+---------+---------+--------------+------------+---------------+--------------+
|           1 | mellouk | youssef | azli         | 0674323676 | directeur     |         NULL |
|           2 | melloor | ali     | sidi youssef | 0654356676 | comptable     |            1 |
|           3 | linor   | saad    | medina       | 0644323676 | propriétaire  |            1 |
|           4 | linory  | said    | MENARA       | 0677323676 | propriétaire  |            1 |
+-------------+---------+---------+--------------+------------+---------------+--------------+
4 rows in set (0.00 sec)

mysql> select * from cheval;
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
| id_cheval | nom_cheval | couleur | no_tatouage | id_female | id_male | id_personne | nom_race |
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
|         1 | CHEV       | blue    |           1 |      NULL |    NULL |           2 | Arabian  |
|         2 | LIN        | red     |           2 |      NULL |    NULL |           2 | Arabian  |
|         3 | men        | red     |           3 |         2 |       1 |           2 | Pottok   |
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
3 rows in set (0.00 sec)

mysql> select * from race;
+----------+-----------+-------------+
| nom_race | poid_type | taille_type |
+----------+-----------+-------------+
| Arabian  | 1000      | 1.80        |
| Pottok   | 375       | 1.552       |
+----------+-----------+-------------+
2 rows in set (0.00 sec)

mysql> select * from concours;
+--------------+-----------------+-----------+------------+
| nom_concours | No_participants | lieu      | annee      |
+--------------+-----------------+-----------+------------+
| mawazine     |              50 | AZLI      | 2022-01-01 |
+--------------+-----------------+-----------+------------+
1 row in set (0.00 sec)

mysql> select * from cheval_concours;
+-----------+--------------+-------+
| id_cheval | nom_concours | place |
+-----------+--------------+-------+
|         1 | mawazine     |     5 |
+-----------+--------------+-------+
1 row in set (0.00 sec)

mysql> select * from croissance;
+---------------+------------+------+--------+-----------+
| id_croissance | mois       | poid | taille | id_cheval |
+---------------+------------+------+--------+-----------+
|             1 | 2023-03-31 |  1100|      2 |         1 |
+---------------+------------+------+--------+-----------+
1 row in set (0.00 sec)

mysql> select * from proprietiare;
+-------------+-----------+--------+------------+
| id_personne | id_cheval | prix   | date_achat |
+-------------+-----------+--------+------------+
|           3 |         1 | 100000 | 2022-03-31 |
+-------------+-----------+--------+------------+
1 row in set (0.00 sec)

mysql> select * from cheval
    -> where nom_race = 'Arabian'
    -> order by nom_cheval desc;
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
| id_cheval | nom_cheval | couleur | no_tatouage | id_female | id_male | id_personne | nom_race |
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
|         1 | CHEV       | blue    |           1 |      NULL |    NULL |           2 | Arabian  |
|         2 | LIN        | red     |           2 |      NULL |    NULL |           2 | Arabian  |
+-----------+------------+---------+-------------+-----------+---------+-------------+----------+
2 rows in set (0.00 sec)


mysql> select nom_cheval,poid_type,taille_type from cheval
    -> join race
    -> where cheval.nom_race = race.nom_race and cheval.nom_race = 'Arabian';
+------------+-----------+-------------+
| nom_cheval | poid_type | taille_type |
+------------+-----------+-------------+
| CHEV    | 1000         | 1.80        |
| LIN     | 1000         | 1.80        |
+------------+-----------+-------------+
2 rows in set (0.00 sec)

mysql> select * from proprietiare;
+-------------+-----------+--------+------------+
| id_personne | id_cheval | prix   | date_achat |
+-------------+-----------+--------+------------+
|           3 |         1 | 100000 | 2022-03-31 |
+-------------+-----------+--------+------------+
1 row in set (0.00 sec)

mysql> select * from personne
    -> where id_encadrant is null;
+-------------+-----------+--------+---------+------------+-----------+--------------+
| id_personne | nom       | prenom | adresse | telephone  | fonction  | id_Encadrant |
+-------------+-----------+--------+---------+------------+-----------+--------------+
|           1 | mellouk   |youssef | azli    | 0674323676 | directeur |         NULL |
+-------------+-----------+--------+---------+------------+-----------+--------------+
1 row in set (0.00 sec)

mysql> insert into concours
    -> values('Persian Week',100,'Rabat','2019-05-25');
Query OK, 1 row affected (0.01 sec)

mysql> select * from concours
    -> where annee between '2019-01-01' and '2019-12-31';
+--------------+-----------------+-------+------------+
| nom_concours | No_participants | lieu  | annee      |
+--------------+-----------------+-------+------------+
| Persian Week |             100 | Rabat | 2019-05-25 |
+--------------+-----------------+-------+------------+
1 row in set (0.00 sec)

mysql>