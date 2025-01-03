use std::io::BufRead;

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

fn main() {
    let reader = std::io::stdin();

    loop {
        let n = read_scalar::<i32>(&mut reader.lock());
        if n == 0 {
            break;
        }

        let v = read_row_vec::<f64>(&mut reader.lock());
        let m = v.iter().sum::<f64>() / n as f64;
        let d = (v.iter().map(|x| (x - m).powi(2)).sum::<f64>() / n as f64).sqrt();

        println!("{}", d);
    }
}
