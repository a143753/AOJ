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

    let nmq = read_row_vec::<i32>(&mut reader.lock());
    let n = nmq[0];
    let m = nmq[1];
    let q = nmq[2];

    let qry = read_matrix::<i32>(&mut reader.lock(), q);

    let mut array = vec![vec![0; m as usize]; n as usize];

    qry.iter().for_each(|row| {
        let i1 = row[0];
        let j1 = row[1];
        let i2 = row[2];
        let j2 = row[3];

        (i1..=i2).for_each(|i| {
            (j1..=j2).for_each(|j| {
                array[i as usize][j as usize] += 1;
            });
        });
    });

    array.iter().for_each(|row| {
        println!(
            "{}",
            row.iter()
                .map(|x| x.to_string())
                .collect::<Vec<_>>()
                .join(" ")
        );
    });
}
