SELECT	'3401010004' AS adm_code,
		(
			SELECT adm.name
			FROM administratives AS adm
			WHERE adm.code = '3401010004'
		) AS adm_name,
		(
			SELECT dis.name
			FROM districts AS dis
			WHERE dis.code = 
				(
					SELECT adm.d_code
					FROM administratives AS adm
					WHERE adm.code = '3401010004'
				) 
		) AS dis_name,
		(
			SELECT aut.name
			FROM autonomous AS aut
			WHERE aut.code =
				(
					SELECT dis.a_code
					FROM districts AS dis
					WHERE dis.code = 
						(
							SELECT adm.d_code
							FROM administratives AS adm
							WHERE adm.code = '3401010004'
						)
				)
		) AS aut_name,
		(
			SELECT pro.name
			FROM provinces AS pro
			WHERE pro.code = 
				(
					SELECT aut.p_code
					FROM autonomous AS aut
					WHERE aut.code =
						(
							SELECT dis.a_code
							FROM districts AS dis
							WHERE dis.code = 
								(
									SELECT adm.d_code
									FROM administratives AS adm
									WHERE adm.code = '3401010004'
								)
						)
				)
		) AS pro_name
;