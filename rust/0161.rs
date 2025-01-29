use std::collections::HashMap;
use std::io::BufRead;
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

fn f(m: Vec<Vec<i32>>) {
    let mut h = HashMap::new();

    m.iter().for_each(|x| {
        let id = x[0];
        let tm = x[1] * 60 + x[2] + x[3] * 60 + x[4] + x[5] * 60 + x[6] + x[7] * 60 + x[8];
        h.entry(id).or_insert(tm);
    });

    let mut v = h.values().collect::<Vec<_>>();
    v.sort();
    [v[0], v[1], v[v.len() - 2]].iter().for_each(|x| {
        h.iter().for_each(|(k, v)| {
            if v == *x {
                println!("{}", k);
            }
        });
    });
}

fn main() {
    let reader = std::io::stdin();

    loop {
        let n = read_scalar::<i32>(&mut reader.lock());
        if n == 0 {
            break;
        } else {
            let m = read_matrix::<i32>(&mut reader.lock(), n as usize, ' ');
            f(m);
        }
    }
}
