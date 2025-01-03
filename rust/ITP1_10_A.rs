use std::io::BufRead;

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
    let v = read_row_vec::<f64>(&mut reader.lock());
    let x1 = v[0];
    let y1 = v[1];
    let x2 = v[2];
    let y2 = v[3];
    let d = ((x2 - x1).powi(2) + (y2 - y1).powi(2)).sqrt();
    println!("{}", d);
}
