use std::io::BufRead;
fn main() {
    let tmp = std::io::stdin()
        .lock()
        .lines()
        .collect::<Result<Vec<_>, _>>()
        .unwrap();
    let mut dat = tmp[1]
        .split_whitespace()
        .map(|x| x.parse::<i64>().unwrap())
        .collect::<Vec<_>>();

    dat.sort();

    println!(
        "{} {} {}",
        dat[0],
        dat[dat.len() - 1],
        dat.iter().sum::<i64>()
    );
}
