use std::io::BufRead;
use std::str::FromStr;

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}

fn read_matrix<T: std::str::FromStr>(
    reader: &mut std::io::StdinLock,
    n: usize,
    s: char,
) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    fn sub<T: std::str::FromStr>(line: &str, s: char) -> Vec<T>
    where
        <T as FromStr>::Err: std::fmt::Debug,
    {
        if s == ' ' {
            line.split_whitespace()
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        } else {
            line.split(s)
                .map(|x| x.parse::<T>().unwrap())
                .collect::<Vec<_>>()
        }
    }

    let mut matrix = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let dt = sub::<T>(&line.unwrap(), s);
            matrix.push(dt);
        });
    }
    matrix
}

fn f(x: i64, a: i64, b: i64) -> i64 {
    a * x + b
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

    let nq: Vec<i64> = read_row_vec(&mut reader);
    let n = nq[0];
    let q = nq[1];

    let ab: Vec<Vec<i64>> = read_matrix(&mut reader, n as usize, ' ');
    let lrp: Vec<Vec<i64>> = read_matrix(&mut reader, q as usize, ' ');

    let mut min = 0;
    lrp.iter().for_each(|e| {
        let l = e[0];
        let r = e[1];
        let p = e[2];

        min = f(p, ab[(l - 1) as usize][0], ab[(l - 1) as usize][1]);
        for i in (l + 1)..=r {
            let s = f(p, ab[(i - 1) as usize][0], ab[(i - 1) as usize][1]);
            if s < min {
                min = s;
            }
        }
        println!("{}", min);
    });
}
