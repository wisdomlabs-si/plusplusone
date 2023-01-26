import React, { CSSProperties } from "react";
import classNames from "classnames";

type ButtonProps = {
  kind: string;
  label?: string;
  small?: boolean;
  icon?: JSX.Element | React.ReactNode | null | undefined;
  disabled?: boolean;
  style?: CSSProperties;
  onClick?(...args: any): void;
};

const Button: React.FC<ButtonProps> = ({ label, onClick, kind, icon, disabled, small, style }) => {
  const buttonClasses = classNames({
    "c-btn": true,
    "c-btn--primary": kind === "primary",
    "c-btn--secondary": kind === "secondary",
    "c-btn--tertiary": kind === "tertiary",
    "c-btn--ghost": kind === "ghost",
    "c-btn--ghost-simple": kind === "ghost-simple",
    "c-btn--danger": kind === "danger",
    "c-btn--tertiary-danger": kind === "tertiary-danger",
    "c-btn--icon": kind === "icon",
    "c-btn--round": kind === "round",
    "c-btn--small": small === true,
  });

  return (
    <button style={style} onClick={onClick} className={buttonClasses} disabled={disabled}>
      {label && label}
      {icon && icon}
    </button>
  );
};

export default Button;
