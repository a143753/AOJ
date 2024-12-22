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

fn read_matrix<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: i32) -> Vec<Vec<T>>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut matrix = Vec::new();
    reader.lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
        matrix.push(dt);
    });
    matrix
}

fn main() {
    let reader = std::io::stdin();

    let xyz = read_row_vec::<i32>(&mut reader.lock());
    let x = xyz[0];
    let y = xyz[1];
    let z = xyz[2];

    let mut array = vec![vec![vec![0; (z + 1) as usize]; (y + 1) as usize]; (x + 1) as usize];

    let n = read_scalar::<i32>(&mut reader.lock());
    let ini = read_matrix::<i32>(&mut reader.lock(), n);

    let q = read_scalar::<i32>(&mut reader.lock());
    let qry = read_matrix::<i32>(&mut reader.lock(), q);

    ini.iter().for_each(|row| {
        let x = row[0];
        let y = row[1];
        let z = row[2];
        array[x as usize][y as usize][z as usize] = 1;
    });

    qry.iter().for_each(|row| {
        let x = row[0];
        let y = row[1];
        let z = row[2];

        if array[x as usize][y as usize][z as usize] == 0 {
            println!("0");
        } else {
            println!("1");
        }
    });
}
