# Assumptions
Dates stored in CSV files are assumed to follow valid date formats.
Email addresses are assumed to be unique for students.
Some CSV files contain inconsistent or incomplete records, therefore nullable fields were allowed where necessary.
Boolean fields such as is_active and is_hidden are represented using TRUE or FALSE values.
Contest problems are handled using a mapping table because one contest can contain multiple problems.
Students can submit multiple submissions for the same problem.
Plagiarism flags can reference two submissions for similarity comparison.
Operation requests are treated as audit and administration records.
Raw student import data is treated as staging data before validation.
CHECK constraints are added only where meaningful values are clearly identifiable from the dataset.