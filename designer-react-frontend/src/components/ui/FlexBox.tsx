import React from "react";
import classNames from "classnames";

type FlexBoxProps = {
  direction?: string;
  justify?: string;
  align?: string;
  wrap?: string;
  className?: string;
  padding?: number;
  children: React.ReactNode;
};

const FlexBox: React.FC<FlexBoxProps> = ({ children, className, direction, align, justify, wrap, padding }) => {
  const flexClasses = classNames({
    "o-flex": true,
    "o-flex--column": direction === "column",
    "o-flex--column-reverse": direction === "column-reverse",
    "o-flex--row-reverse": direction === "row-reverse",
    "o-flex--wrap": wrap === "wrap",
    "o-flex--wrap-reverse": wrap === "reverse",
    "o-flex--justify-start": justify === "start",
    "o-flex--justify-end": justify === "end",
    "o-flex--justify-center": justify === "center",
    "o-flex--justify-between": justify === "between",
    "o-flex--justify-around": justify === "around",
    "o-flex--justify-evenly": justify === "evenly",
    "o-flex--align-start": align === "start",
    "o-flex--align-end": align === "end",
    "o-flex--align-center": align === "center",
  });

  const styles = {
    padding: padding,
  };
  return (
    <div className={`${flexClasses} ${className}`} style={styles}>
      {children}
    </div>
  );
};

export default FlexBox;
