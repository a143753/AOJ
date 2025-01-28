use std::io::BufRead;
use std::str::FromStr;

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

fn main() {
    let reader = std::io::stdin();
    let n = read_matrix::<f32>(&mut reader.lock(), 0, ',');

    n.iter().for_each(|x| {
        let bmi = x[1] / x[2] / x[2];
        if bmi >= 25.0 {
            println!("{}", x[0]);
        }
    });
}
