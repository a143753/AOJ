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
    let n = read_scalar::<i64>(&mut reader.lock());

    for _ in 0..n {
        let i = read_row_vec::<f32>(&mut reader.lock());
        let x1 = i[0];
        let y1 = i[1];
        let x2 = i[2];
        let y2 = i[3];
        let x3 = i[4];
        let y3 = i[5];
        let x4 = i[6];
        let y4 = i[7];

        let a12 = (y1 - y2) / (x1 - x2);
        let a34 = (y3 - y4) / (x3 - x4);

        if a12 == a34 {
            println!("YES");
        } else {
            println!("NO");
        }
    }
}
