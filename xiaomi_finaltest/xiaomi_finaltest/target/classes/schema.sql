USE xiaomi;

DROP TABLE IF EXISTS vehicle_info;
CREATE TABLE vehicle_info (
                              car_id INT AUTO_INCREMENT PRIMARY KEY,
                              vid VARCHAR(16) NOT NULL,
                              battery_type ENUM('三元电池', '铁锂电池') NOT NULL,
                              total_mileage INT NOT NULL,
                              battery_health_state INT NOT NULL
);

INSERT INTO vehicle_info (vid, battery_type, total_mileage, battery_health_state) VALUES
                                                                                      ('1', '三元电池', 100, 100),
                                                                                      ('2', '铁锂电池', 600, 95),
                                                                                      ('3', '三元电池', 300, 98);

DROP TABLE IF EXISTS warning_rules;
CREATE TABLE warning_rules (
                               id INT AUTO_INCREMENT PRIMARY KEY,
                               rule_id INT NOT NULL,
                               name VARCHAR(255) NOT NULL,
                               battery_type ENUM('三元电池', '铁锂电池') NOT NULL,
                               rule_description TEXT NOT NULL
);

INSERT INTO warning_rules (rule_id, name, battery_type, rule_description) VALUES
                                                                              (1, '电压差报警', '三元电池', '{"rules": [{"threshold": 5, "level": 0}, {"threshold": 3, "level": 1}, {"threshold": 1, "level": 2}, {"threshold": 0.6, "level": 3}, {"threshold": 0.2, "level": 4}, {"threshold": 0, "level": 5}]}'),
                                                                              (2, '电压差报警', '铁锂电池', '{"rules": [{"threshold": 2, "level": 0}, {"threshold": 1, "level": 1}, {"threshold": 0.7, "level": 2}, {"threshold": 0.4, "level": 3}, {"threshold": 0.2, "level": 4}, {"threshold": 0, "level": 5}]}'),
                                                                              (3, '电流差报警', '三元电池', '{"rules": [{"threshold": 3, "level": 0}, {"threshold": 1, "level": 1}, {"threshold": 0.2, "level": 2}, {"threshold": 0, "level": 5}]}'),
                                                                              (4, '电流差报警', '铁锂电池', '{"rules": [{"threshold": 1, "level": 0}, {"threshold": 0.5, "level": 1}, {"threshold": 0.2, "level": 2}, {"threshold": 0, "level": 5}]}');
