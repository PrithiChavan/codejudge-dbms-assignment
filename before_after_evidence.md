# BEFORE AND AFTER EVIDENCE

## Repair 1 : Negative Scores

### Before Repair
| submission_id | score |
|---------------|-------|
| 2051 | -5 |

### Repair Applied
Updated negative score to 0.

### After Repair
| submission_id | score |
|---------------|-------|
| 2051 | 0 |

------------------------------------------------------------

## Repair 2 : Scores Greater Than Maximum Marks

### Before Repair
| submission_id | score |
|---------------|-------|
| 3010 | 120 |

### Repair Applied
Updated score greater than 100 to maximum allowed value 100.

### After Repair
| submission_id | score |
|---------------|-------|
| 3010 | 100 |

------------------------------------------------------------

## Repair 3 : Invalid Difficulty Values

### Before Repair
| problem_id | difficulty |
|------------|------------|
| 501 | Very Hard |

### Repair Applied
Updated invalid difficulty to Medium.

### After Repair
| problem_id | difficulty |
|------------|------------|
| 501 | Medium |

------------------------------------------------------------

## Repair 4 : Blank Student Names

### Before Repair
| student_id | name |
|------------|------|
| 212 | NULL |

### Repair Applied
Updated blank name with placeholder value.

### After Repair
| student_id | name |
|------------|----------------|
| 212 | Unknown Student |

------------------------------------------------------------

## Repair 5 : Invalid Submission Status

### Before Repair
| submission_id | status |
|---------------|--------|
| 4022 | Done |

### Repair Applied
Updated invalid status to Pending.

### After Repair
| submission_id | status |
|---------------|---------|
| 4022 | Pending |

------------------------------------------------------------

## Repair 6 : Duplicate Enrollment Records

### Before Repair
| student_id | course_id | duplicate_count |
|------------|-----------|-----------------|
| 55 | 12 | 2 |

### Repair Applied
Deleted duplicate enrollment records and kept one valid row.

### After Repair
No duplicate enrollment records found.

------------------------------------------------------------

## Repair 7 : Invalid Email Format

### Before Repair
| student_id | email |
|------------|----------------|
| 333 | studentgmail.com |

### Repair Applied
Generated temporary valid email format.

### After Repair
| student_id | email |
|------------|--------------------|
| 333 | 333@example.com |

------------------------------------------------------------

## Repair 8 : Contest End Time Before Start Time

### Before Repair
| contest_id | start_time | end_time |
|------------|-------------------|-------------------|
| 44 | 2025-05-10 10:00 | 2025-05-10 08:00 |

### Repair Applied
Updated end time using valid contest duration.

### After Repair
| contest_id | start_time | end_time |
|------------|-------------------|-------------------|
| 44 | 2025-05-10 10:00 | 2025-05-10 12:00 |

------------------------------------------------------------

# Summary

All repairs were applied only on staging tables.
Original imported tables were not modified directly.
The repair process improved data quality, consistency, and integrity.