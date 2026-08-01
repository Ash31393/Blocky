import sqlite3

con = sqlite3.connect(r'C:\Users\Ashin\blocky\data\sqlite\learning.db')
cur = con.cursor()

rows = [
    (1, 1, 'pass', 92),
    (1, 2, 'fail', 38),
    (1, 2, 'pass', 84),
    (1, 3, 'fail', 41),
    (1, 3, 'fail', 45),
    (1, 4, 'pass', 88),
    (1, 5, 'pass', 91),
    (1, 6, 'fail', 40),
    (1, 7, 'pass', 95),
]

cur.executemany(
    "INSERT INTO submissions (user_id, checkpoint_id, status, score) VALUES (?, ?, ?, ?)",
    rows
)
con.commit()

count = cur.execute('SELECT count(*) FROM submissions').fetchone()[0]
print(f'Done. submissions now has {count} rows.')

# Quick view check
funnel = cur.execute('SELECT count(*) FROM v_completion_funnel').fetchone()[0]
hotspots = cur.execute('SELECT count(*) FROM v_error_hotspots').fetchone()[0]
print(f'v_completion_funnel rows: {funnel}')
print(f'v_error_hotspots rows: {hotspots}')

con.close()
