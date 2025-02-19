use std::io::{self, BufRead};
use std::str::FromStr;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
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

fn f(q: Vec<Vec<i64>>) -> (i64, i64) {
    let mut a = 0;
    let mut b = 1;

    q.iter().for_each(|e| {
        let q = e[0];
        let x = e[1];

        if q == 1 {
            a *= x;
            b *= x;
        } else if q == 2 {
            a -= x;
        } else if q == 3 {
            a += x;
        }
    });

    (a, b)
}

fn main() {
    let reader = io::stdin();
    let n = read_scalar::<usize>(&mut reader.lock());
    let q = read_matrix::<i64>(&mut reader.lock(), n, ' ');

    let (a, b) = f(q);

    println!("{} {}", a, b);
}
