import pg from "pg";

const { Pool } = pg;

const pool = new Pool({
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "Nhochuy900",
  database: "cesium_gis",
});

export default pool;
