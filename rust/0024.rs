use std::io::BufRead;

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

    let v: Vec<f32> = read_col_vec(&mut reader, 0);

    v.iter().for_each(|x| {
        let t = x / 9.8;
        let y = 4.9 * t * t;
        let a = 1 + (y / 5.0).ceil() as i32;

        println!("{}", a);
    });
}
