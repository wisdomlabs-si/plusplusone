import React from "react";

type Props = {
  prop: { name: string; value: string | number | boolean };
};

const Prop: React.FC<Props> = ({ prop }) => {
  return (
    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", width: "100%" }}>
      <span>
        <strong>{prop.name}:</strong> {prop.value.toString()}
      </span>
    </div>
  );
};
export default Prop;
